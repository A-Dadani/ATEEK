//ENV
require("dotenv").config();
require("express-async-errors");

//EXPRESS
const express = require("express");
const server = express();

const cookieParser = require("cookie-parser");
const cors = require("cors");

const notFoundMiddleware = require("./middleware/not-found.js");
const errorHandlerMiddleware = require("./middleware/error-handler.js");

global.__basedir = __dirname;

//routes
const authRouter = require("./routes/authRoute.js");
const pharmaciesRouter = require("./routes/pharmacies.js");
const pharmacistsRouter = require("./routes/pharmacists.js");
const productsRouter = require("./routes/products.js");

server.use(cors());
server.use(express.json());
server.use(express.urlencoded({ extended: true }));
server.use(cookieParser());

server.use("/api/v0/auth", authRouter);
server.use("/api/v0/pharmacies", pharmaciesRouter);
server.use("/api/v0/pharmacists", pharmacistsRouter);
server.use("/api/v0/products", productsRouter);

if (process.env.NODE_ENV === "production") {
    server.use(notFoundMiddleware);
    server.use(errorHandlerMiddleware);
}

server.use(express.static("./public"));
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
};

start();