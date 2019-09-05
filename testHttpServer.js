
var http = require('http');

var server = http.createServer(function (request, response) {
    console.log('someone access your http server')


    response.write('Hello, this is a test http server')
    response.end()
})


server.listen(80, '127.0.0.1')


console.log('started 80 http server')
