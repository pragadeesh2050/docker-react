# Stage 1
FROM node:alpine AS reactBuild

WORKDIR '/reactapp'

COPY package.json ./package.json

RUN npm install

COPY . .

RUN npm run build


#Stage 2

FROM nginx:alpine

COPY --from=reactBuild /reactapp/build /usr/share/nginx/html

