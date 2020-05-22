FROM alpine

# Update
RUN apk add --update nodejs npm

# Install app dependencies
COPY package.json /src/package.json
COPY index.js /src/index.js
RUN cd /src; npm install

EXPOSE 3030
CMD ["node", "/src/index.js"]