FROM node:13.8

WORKDIR /app

COPY package.json /app/
COPY package-lock.json /app/

RUN npm install

CMD npm run serve