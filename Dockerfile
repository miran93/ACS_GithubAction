FROM node:14 AS builder
WORKDIR /app
COPY ./package.json ./
RUN npm install
RUN npm audit fix
COPY . .
RUN npm i -g @nestjs/cli


FROM node:14-alpine
WORKDIR /app
COPY --from=builder /app ./
CMD ["npm", "run", "start:prod"]
