FROM node:21.6.0-bullseye-slim@sha256:ef46f8bf489e6a6c2d056e0c0bec23a4120b34aabb9551a446baf68282defa01 AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]