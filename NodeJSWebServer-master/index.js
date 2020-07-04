const http = require('http');
var url = require("url");
const os = require('os');
const port = 3030;
const content = process.env.SERVERCONTNET || "Hello world from remote cluster";

const requestHandler = (request, response) => {
    const path = url.parse(request.url).pathname;

    if (path == "/failsometimes") {
        if (Math.floor((Math.random() * 3)) == 0) {
            response.statusCode = 500;
        }
    }

    response.end(content + " requested from " + url.parse(request.url).pathname + " on " + os.hostname()+ " in remote cluster  with code " + response.statusCode);
};

const server = http.createServer(requestHandler);

server.listen(port, (err) => {
    if (err) {
        return console.log('something bad happened', err);
    }

    console.log(`server is listening on ${port}`);
});