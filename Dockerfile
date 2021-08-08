# https://nodejs.org/en/docs/guides/nodejs-docker-webapp/
# https://snyk.io/blog/10-best-practices-to-containerize-nodejs-web-applications-with-docker/

FROM node:14.4-alpine3.11
RUN apk add dumb-init
ENV NODE_ENV production
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci --only=production
COPY --chown=node:node . .
EXPOSE 8080
USER node
CMD ["dumb-init", "node", "app.js"]