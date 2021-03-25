
FROM node:9-alpine
WORKDIR /var/www/app
ADD package.json .
RUN npm install
ADD . .
CMD echo "teste"
ENTRYPOINT node server.js
