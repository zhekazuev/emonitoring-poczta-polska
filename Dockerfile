FROM python:3.8-slim-buster
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
COPY /src /src
CMD [ "python3", "/src/app/app.py", "-m" , "flask", "run", "--host=0.0.0.0"]