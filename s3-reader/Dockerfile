FROM node:18-alpine

RUN mkdir /app
WORKDIR /app

COPY package.json /app/package.json
RUN npm install

COPY index.js /app/index.js

ENTRYPOINT ["npm", "start"]