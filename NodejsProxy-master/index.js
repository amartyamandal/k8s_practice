// content of index.js
const http = require('http');
const url = require('url');
const requestService = require('request');
const port = 3030;
const proxyUrl = process.env.PROXYURL || "https://raw.githubusercontent.com/amartyamandal/k8s_practice/master/NodejsProxy-master/helloworld.txt";

const requestHandler = (request, response) => {
    const path = url.parse(request.url).pathname;
    const start = new Date().getTime();
    requestService(proxyUrl + (path == "/" ? "" : path), (err, res, body) => {
        const duration = new Date().getTime() - start;
        if (err) {
            response.end(err.toString() + " - Took " + duration + " milliseconds, printout from remote cluster");
        } else {
            response.end("Proxying value: " + body + " - Took " + duration + " milliseconds, printout from remote cluster");
        }
    });
}

const server = http.createServer(requestHandler);

server.listen(port, (err) => {
    if (err) {
        return console.log('something bad happened', err);
    }

    console.log(`server is listening on ${port}`);
});