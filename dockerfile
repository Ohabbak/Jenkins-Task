FROM node:18-alpine

WORKDIR /app

COPY ./react-app/my-app/. .
RUN npm install

CMD npm start