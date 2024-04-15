FROM node:21 AS build-stage

ENV APP_ROOT=/frontend

RUN mkdir ${APP_ROOT}

WORKDIR ${APP_ROOT}

COPY ./frontend/package*.json .

RUN npm install  -g npm@10.5.2

COPY ./frontend .

RUN npm run dev

FROM nginx:1.24-alpine

COPY --from=build-stage /app/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
