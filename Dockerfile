FROM node:22.5.0-bullseye-slim@sha256:0ce8d2917108da31ffb7a515fe8393b3ebb773f49c17e32dd0b548689f86dec8 AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]