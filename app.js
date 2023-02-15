//ENV
require("dotenv").config();
require("express-async-errors");

//EXPRESS
const express = require("express");
const server = express();

global.__basedir = __dirname;

//routes
const authRouter = require("./routes/authRoutes.js");

server.use(express.json());
server.use(express.urlencoded({extended: true}));

server.use(express.static("./public"));

server.use("/api/v0/auth", authRouter);

const port = process.env.PORT || 3000;
const start = async () => {
    try {
        server.listen(port, () => {
            console.log(`--> Listening on port ${port}...`);
        });
    } catch (error) {
        console.log(error);
        console.log("Fatal error!");
    }
}

start();