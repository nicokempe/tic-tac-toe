FROM node:22.1.0-bullseye-slim@sha256:3fd44a8648f66c1713cceb4e10087546fc7c4a040abf1e3c75406a17e5032fea AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]