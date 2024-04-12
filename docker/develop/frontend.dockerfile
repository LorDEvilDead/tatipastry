FROM node:20-buster

ENV APP_ROOT=/frontend

RUN mkdir ${APP_ROOT}

WORKDIR ${APP_ROOT}

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

FROM nginx:1.24-alpine

COPY --from=build-stage /app/public /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
