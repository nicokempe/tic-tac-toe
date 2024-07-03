FROM node:22.4.0-bullseye-slim@sha256:5e636db3e261240a86362aa7ce3bfc6bc0c65d5d38e8c3c7ad1a6471372a1f3e AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]