# BUILDER PHASE
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# /app/build --> all the studd we careabount production version

# RUN PHASE
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html 