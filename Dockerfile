FROM node:21.4.0-bullseye-slim@sha256:3afb93c631e692edb893a403d25f9b4cae4b03748244cc9804c31dd957235682 AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]