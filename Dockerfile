# Create app directory
FROM node:16-alpine
WORKDIR /usr/app

COPY package*.json yarn.lock ./

RUN yarn --frozen-lockfile

COPY . .

EXPOSE 5000
CMD [ "yarn", "start" ]