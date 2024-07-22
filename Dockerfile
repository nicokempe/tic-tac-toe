FROM node:22.5.1-bullseye-slim@sha256:9e8b352001691ae3859ecb56a733eba26af4fb7da79d5a3c999ae21b628b5cfd AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]