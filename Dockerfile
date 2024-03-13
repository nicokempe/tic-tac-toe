FROM node:21.7.1-bullseye-slim@sha256:171ef3fbe4686fd6b92d0cdbcb24c5efb343cf4d4f87305677220b89f1873b0c AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]