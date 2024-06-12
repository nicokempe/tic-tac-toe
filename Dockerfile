FROM node:22.3.0-bullseye-slim@sha256:dabb7baa6f90d288473d86da189e7273ecc2c9904879d121b4ea28bc429ca6ed AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]