FROM node:22.2.0-bullseye-slim@sha256:5baa25a7a7d4fde6ae7180db579f930748b9c6cd9c2ccf0065b9ea2c61585405 AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]