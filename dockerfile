FROM node:18-alpine AS build

WORKDIR /app

COPY react-app/my-app/. /app/

RUN npm install
RUN npm run build


FROM nginx:alpine 


COPY --from=build /app/build /usr/share/nginx/html  