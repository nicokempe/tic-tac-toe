FROM node:21.7.2-bullseye-slim@sha256:c77336dd02a5ae20328ea1c33b9f648dbfc848080c8562d325304251a86faa08 AS production
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build
EXPOSE 8080
CMD ["npm", "run", "serve"]