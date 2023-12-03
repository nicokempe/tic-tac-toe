FROM node:20.8.0-bullseye-slim@sha256:ae31e40fdecf15751ee23055b60717e2ce6e03acc4ee7ffd8f87e76813d8010f AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]