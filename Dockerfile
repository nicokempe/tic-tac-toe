FROM node:21.7.3-bullseye-slim@sha256:65881997e49f9118732af6e10e88cd6b632df8c8f1b0d47009c604103a46d955 AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]