FROM node:12-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY ./app/package*.json ./
USER node
RUN npm install --production
COPY --chown=node:node ./app .
EXPOSE 3000
CMD [ "node", "server.js" ]