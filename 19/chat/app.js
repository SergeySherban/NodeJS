const app = require('express')();
const http = require('http').Server(app);
const io = require('socket.io')(http);

app.get('/', function (req, res) {
    res.sendFile(__dirname + '/index.html');
});

const users = [];
io.on('connection', function (socket) {
    console.log('A user connected');
    socket.on('setUserName', function (data) {
        console.log(data);
        if(users.indexOf(data) > -1) {
            console.log(data);
            socket.emit('userExists', `<p class="bg-primary">
            Пользователь <b>${data}</b> уже существует, выберите другое имя
            </p>`)
        } else {
            users.push(data);
            socket.emit('userSet', {userName: data});
        }
    });

    socket.on('message', function (data) {
        io.sockets.emit('newMessage', data);
    });
});

http.listen(3000, function () {
    console.log('Go to chat at http://localhost:3000')
});