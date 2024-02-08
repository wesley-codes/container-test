FROM node:latest AS BUILD_IMAGE
LABEL "Project"="Loctech"
LABEL "Author"="Eze Nnameka"

WORKDIR /app
RUN git clone https://github.com/wesley-codes/container-test.git
RUN npm install 
RUN  npm run build

FROM node:latest
WORKDIR /app
COPY --from=BUILD_IMAGE /app/dist ./dist
COPY --from=BUILD_IMAGE /app/package*.json ./
RUN npm install
EXPOSE 3000
CMD [ "npm", "start" ]