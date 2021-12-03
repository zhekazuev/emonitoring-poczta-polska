FROM mpsorg/sass-compiler AS sass-compiler
COPY /src/scss/ /tmp/before/scss/
RUN mkdir /tmp/after/css/
RUN sass sass --no-source-map --style=compressed /tmp/before/scss/style.scss:/tmp/after/css/style.css

FROM node:alpine AS html-minifier
COPY /src/app/templates/ /tmp/before/templates/
RUN npm install html-minifier
RUN html-minifier --collapse-whitespace --remove-comments --input-dir /tmp/before/templates/ --output-dir /tmp/after/templates/ --file-ext html

FROM python:3.8-slim-buster
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY /src/design/img/ /src/design/img/
COPY /src/app/*.py /src/app/
COPY --from=sass-compiler /tmp/after/css/ /src/design/css/
COPY --from=html-minifier /tmp/after/templates /src/app/templates/
CMD [ "python3", "/src/app/app.py", "-m" , "flask", "run", "--host=0.0.0.0"]