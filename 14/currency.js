const http = require('http');
const fs = require('fs');
const request = require('request');
const port = 3000;

http.createServer(function(req, res) {
    if (req.url === '/') {
        request('https://api.privatbank.ua/p24api/pubinfo?json&exchange&coursid=3', function(error, response, body) {
            if (!error && response.statusCode == 200) {
                let dataCurrency = JSON.parse(body);
                let USD = 'Selling dollar: ' + dataCurrency[2].sale;
                fs.writeFile('currency.html', USD,'utf-8', function(err) {
                    if (err) throw err;
                    console.log('Currency loaded');
                });
            }
        });
        fs.readFile('currency.html', 'utf-8', function(err, data) {
            res.write(data);
            res.end();
        })
    } else {
        res.write('Route not found');
        res.end();
    }
}).listen(port, function() {
    console.log('Server at http://localhost:3000');
})
