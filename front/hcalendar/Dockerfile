FROM node:24-alpine AS build

ARG REACT_APP_API_URL

ENV REACT_APP_API_URL=$REACT_APP_API_URL

WORKDIR /src

COPY . .

RUN npm install

RUN npm run build


FROM nginx:1.27.5-alpine

COPY nginx.conf /etc/nginx/nginx.conf

COPY --from=build /src/build /usr/share/nginx/html

EXPOSE 80