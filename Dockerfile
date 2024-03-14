FROM node:21.7.1-bullseye-slim@sha256:eacf88f50e8c5b5f9e3ff757a1ca078c2e249d601cb9ac90b515932a09164e74 AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]