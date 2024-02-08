FROM node:latest AS BUILD_IMAGE
LABEL "Project"="Loctech"
LABEL "Author"="Eze Nnameka"


RUN git clone https://github.com/wesley-codes/container-test.git \
    && cd /container-test/ \
    && npm install \
    && npm run build

FROM node:latest
COPY --from=BUILD_IMAGE /dist ./dist
COPY --from=BUILD_IMAGE /package*.json ./
RUN npm install
EXPOSE 3000
CMD [ "npm", "start" ]