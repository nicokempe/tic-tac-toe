FROM node:21.5.0-bullseye-slim@sha256:a46d5f82c3c88ff4870bff5203e9fda43699719e3a458a4dbf4691e80951db5a AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]