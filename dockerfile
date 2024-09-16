FROM node:18-alpine

WORKDIR /app

COPY ./react-app/my-app/. .

CMD npm start