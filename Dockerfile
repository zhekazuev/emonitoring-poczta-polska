FROM mpsorg/sass-compiler AS sass-compiler
COPY /src/scss /scss
RUN mkdir /css
RUN sass /scss:/css

FROM python:3.8-slim-buster
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY /src/design /src/design
COPY /src/app /src/app
RUN mkdir -p /src/design/css
COPY --from=sass-compiler /css /src/design/css
CMD [ "python3", "/src/app/app.py", "-m" , "flask", "run", "--host=0.0.0.0"]