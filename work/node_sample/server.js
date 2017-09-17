/************************************************
 *              QuickStartServer   v0.2         *
 *       Simple HTTP server for development     *
 *    License: No license, just Public Domain   *
 *             Dariusz Chilimoniuk              *
 ************************************************/
 
/*jslint node: true */
"use strict"; 

var pubDir = 'public';
var port = 80;
var consoleLogLevel = 0;  // 0-errors, 1-all

var http = require('http');
var fs = require('fs');
var path = require('path');
var mime = require('mime');
var qs = require('querystring');

var items = [];

function sendHttpError(number, response, msg) {
    if (!response.headersSent) {
        var info = number + ': ' + msg;
        response.writeHead(number, {'Content-Type': 'text/plain'});
        response.end(info);
        console.log(info);
    } else {
        console.log('Interrupted: ' + msg);
    }
}

function sendFile(res, absPath) {
    fs.stat(absPath, function (err, stat) {
        if (err) {
            if ('ENOENT' === err.code) {
                sendHttpError(404, res, absPath + '   (not found)');
            } else {
                sendHttpError(500, res, absPath + '   (' + err.code + '); 1');
            }
        } else {
            var errorFlag = false;
            var readFlag = false;
            var stream = fs.createReadStream(absPath);

            stream.on('error', function (err) {
                if (!errorFlag) {  // is error happend before?
                    errorFlag = true;
                    sendHttpError(403, res, absPath + '   (' + err.code + ')');
                }
            });
            stream.once('readable', function (err) {
                if (!errorFlag) {  // is error happend before?
                    readFlag = true;          
                    res.once('pipe', function () {  // run when piping is activated
                        if (!errorFlag) {
                            res.setHeader('Content-Length', stat.size);
                            res.setHeader('Content-Type', mime.lookup(path.basename(absPath)));
                        }
                    });
                    res.on('error', function (err) {
                        if (!errorFlag) {  // is error happend before?
                            errorFlag = true;
                            sendHttpError(500, res, absPath + '   (' + err.code + '); 2');
                        }
                    });
                    res.on('finish', function () {
                        if (!errorFlag && consoleLogLevel >= 1) {
                            console.log('200: ' + absPath);  // file send successfully
                        }
                    });
                    stream.pipe(res); // pipe "file stream" to "response stream" 
                }
            });
        }
    });
}

var server = http.createServer(function (req, res) {
    var filePath = req.url;

    if (filePath === '/') {
        filePath = path.join(filePath, 'index.html');
    }
    filePath = path.join(pubDir, filePath);

    var body = '';
    switch (req.method) {

    case 'POST':
        req.setEncoding('utf8');
        req.on('error', function (err) {
            console.log('Problem with request: ${err.message}');
        });
        req.on('data', function (chunk) {
            body += chunk;
        });
        req.on('end', function () {
            items = [];
            items.push(qs.parse(body));
        });
        sendFile(res, filePath);
        break;
    case 'GET':
        sendFile(res, filePath);
        break;
    // HEAD, PUT, DELETE, OPTIONS...
    default:
        sendHttpError(405, res, 'HTTP ' + req.method + ' ' + req.url + '   (Method Not Allowed)');
    }
});

server.on('clientError', function (err, socket) {
    //server.response.end('400 HTTP   (Bad Request)');
    if (err.code !== 'ECONNRESET') {
        console.log('HTTP/1.1 400 Bad Request  (' + err.message + ' - ' + err.code + ')');
        socket.end('HTTP/1.1 400 Bad Request  (' + err.message + ' - ' + err.code + ')\r\n\r\n');
    } else {
        console.log('Remote connection closed  (' + err.code + ')');
        socket.end();
    }
});

server.on('error', function (err) {
    if (err.code === 'EADDRINUSE') {
        console.log('Fail: Port ' + port + ' is already in use');
    } else {
        console.log('Fail: Can not start server (' + err.code + ')');
    }
});
server.listen(port, function () {
    console.log(
        'Ready: ' + path.resolve(pubDir) + ' => http://localhost' +
        (port === 80
            ? ''
            : ':' + port)
    );
});
