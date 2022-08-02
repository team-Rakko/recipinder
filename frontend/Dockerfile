FROM node:16.16.0
WORKDIR frontend
COPY ./package*.json ./
RUN npm ci
COPY ./ /frontend/
EXPOSE 3000
EXPOSE 3001
