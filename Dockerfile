
FROM node:9-alpine
WORKDIR /var/www/app
USER root
RUN chmod 1777 /tmp
ADD package.json .
RUN npm install
ADD . .
CMD echo "teste"
ENTRYPOINT node server.js
