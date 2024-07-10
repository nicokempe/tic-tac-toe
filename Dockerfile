FROM node:22.4.1-bullseye-slim@sha256:1399b299f2d236677007709378929b8216b41602ef4b0c54c226c895b4a175ca AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]