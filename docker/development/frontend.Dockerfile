FROM node:21

ENV APP_ROOT=/frontend

RUN mkdir ${APP_ROOT}

WORKDIR ${APP_ROOT}

COPY ./frontend/package*.json .

RUN npm install  -g npm@10.5.2

COPY ./frontend .

RUN yarn add --dev vite
RUN npm run build
