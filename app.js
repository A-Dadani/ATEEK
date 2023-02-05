//ENV
require("dotenv").config();

//EXPRESS
const express = require("express");
const server = express();

const { getAuth, createUserWithEmailAndPassword } = require("firebase/auth");

const {firebase} = require("./config/firebase-config.js");

// Initialize Firebase Authentication and get a reference to the service
const auth = getAuth(firebase);

server.use(express.json());
server.use(express.urlencoded({extended: true}));

server.use(express.static("./public"));

server.post("/signup", (req, res) => {
    const emailg = req.body.email;
    const pass = req.body.password;
    createUserWithEmailAndPassword(auth, emailg, pass)
        .then((userCredentials) => {
            console.log(userCredentials);
            res.status(200).json(userCredentials);
        })
        .catch ((error) => {
            console.log("ERROR THROWN!");
            console.log(error);
        });
})

const port = process.env.PORT || 3000;
const start = async () => {
    try {
        server.listen(port, () => {
            console.log(`Listening on port ${port}...`);
        });
    } catch (error) {
        console.log(error);
        console.log("Fatal error!");
    }
}

start();