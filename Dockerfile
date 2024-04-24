FROM node:21.7.3-bullseye-slim@sha256:fa3e5c0bbb97cabc5f40b2df3a60883beba1b16bebed01206c584b0ca9f6ea3c AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]