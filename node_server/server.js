var http = require('http');
var fs = require('fs');

// 404 response
function send404Response(response) {
    response.writeHead(404, {"Context-Type": "text/plain"});
    response.write("Page not found");
    response.end();
}

function onRequest(request, response) {
    console.log(request.url);
    console.log(new Date());
    if(request.method == 'GET' && request.url == '/' ){
        response.writeHead(202, {"Context-Type": "text/html"});
        fs.createReadStream("./index.html").pipe(response);
    }else{
        send404Response(response);
    }
}

http.createServer(onRequest).listen(8888);
console.log("server is now running....");