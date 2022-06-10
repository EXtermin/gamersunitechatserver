const app = require('express');
const http = require('http').Server(app);
const io = require("socket.io")(http, {
    cors: {
        origin: "*",
    }
});

const comments = {};

io.on('connection', socket => {
    let previousId;
    const safeJoin = currentId => {
        socket.leave(previousId);
        socket.join(currentId);
        previousId = currentId;
    };
    socket.on("addComment", comment => {
        comments[comment.id] = comment;
        safeJoin(comment.id);
        socket.emit("comments", comments);
        io.emit("comment", comment);
    });
    socket.on("typingComment", flag => {
        io.emit("typing", flag)
    });
    io.emit("comments", comments);
});

http.listen(4444);
