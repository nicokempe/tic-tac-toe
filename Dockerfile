FROM node:22.0.0-bullseye-slim@sha256:e0110bf0d381c3dd1d3e9d14190f7a1940a861122fcb228c1473fa065f168529 AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]