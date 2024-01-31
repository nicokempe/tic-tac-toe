FROM node:21.6.1-bullseye-slim@sha256:383ded27268efc3424c99e8e48f1f227f6e9467852ba7cb1e10cfa4e9a893c8a AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]