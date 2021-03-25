
FROM node:9-alpine
USER root
RUN chmod 1777 /tmp
WORKDIR /var/www/app
ADD package.json .
RUN npm install
ADD . .
CMD echo "teste1"
ENTRYPOINT node server.js
