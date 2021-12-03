FROM node:lts-alpine AS sass-compiler
WORKDIR /src
COPY src/scss/ before/scss/
RUN npm install -g sass && \
    sass --no-source-map --style=compressed /src/before/scss/style.scss:/src/after/css/style.css

FROM node:lts-alpine AS html-minifier
WORKDIR /src
COPY /src/app/templates/ before/templates/
RUN npm install -g html-minifier cssnano uglify-js && \
    html-minifier --collapse-whitespace --remove-comments --input-dir /src/before/templates/ --output-dir /src/after/templates/ --file-ext html

FROM python:3.8-slim-buster
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY /src/design/img/ /src/design/img/
COPY /src/app/*.py /src/app/
COPY --from=sass-compiler /src/after/css/ /src/design/css/
COPY --from=html-minifier /src/after/templates /src/app/templates/
CMD [ "python3", "/src/app/app.py", "-m" , "flask", "run", "--host=0.0.0.0"]
