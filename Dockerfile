# Flask uses bjoern like a wsgi
# Python base
FROM python:3.8-alpine as base

# Stage 1 - Compile scss and minimize html/css
FROM node:alpine AS front-compiler
WORKDIR /tmp
COPY package*.json .
RUN npm ci
COPY src/scss/ before/scss/
COPY src/app/templates/ before/
RUN npm run build

# Stage 2 - Delete python trash and builds
FROM base as builder
RUN mkdir /install
WORKDIR /install
COPY requirements.txt /requirements.txt
RUN apk add gcc libc-dev libev-dev \
    && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir --prefix=/install -r /requirements.txt
RUN find /install -name '*.c' -delete
RUN find /install -name '*.pxd' -delete
RUN find /install -name '*.pyd' -delete
RUN find /install -name '*.pyo' -delete
RUN find /install -name '*.pyc' -delete
RUN find /install -name '__pycache__' | xargs rm -r

# Stage 3 - Copy files and run
FROM base
WORKDIR /src
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
EXPOSE 5000
RUN apk add libev
COPY --from=builder /install /usr/local
COPY /src/app/*.py ./app/
COPY /src/design/img ./design/img
COPY --from=front-compiler /tmp/after/css design/css/
COPY --from=front-compiler /tmp/after/*.html app/templates/
CMD [ "python", "app/bjoern.py"]
