FROM node:20-buster

ENV APP_ROOT=/frontend

RUN mkdir ${APP_ROOT}

WORKDIR ${APP_ROOT}

COPY ./frontend/package*.json .

RUN yarn install

COPY ./frontend .

RUN yarn build
