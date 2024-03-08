FROM node:21.7.0-bullseye-slim@sha256:cfa357b2b0c37e66057525c0e8b06cf1cb54f9cb5534b401b0a587df794a25df AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]