FROM node:18-alpine

RUN mkdir /app
WORKDIR /app

COPY index.js /app/index.js
COPY package.json /app/package.json
RUN npm install

ENTRYPOINT ["npm", "start"]