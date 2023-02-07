const { getAuth, createUserWithEmailAndPassword } = require("firebase/auth");
const {firebase} = require("../config/firebase-config.js");
const {BadRequestError} = require("../errors");

const singupWithEmail = async (req, res) => {
    const email = req.body.email;
    const password = req.body.password;
    const regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    const regexPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/;
    if (!email || !password) {
        throw new BadRequestError("Please provide both an Email and a password!");
    }
    if (!email.match(regexEmail)) {
        throw new BadRequestError("Please provide a valid email adress.");
    }
    if (!password.match(regexPass)) {
        throw new BadRequestError("Password must be between 8 and 20 characters long and contain at least one uppercase and one lowercase letter and one number.");
    }
    const auth = getAuth(firebase);
    const userCredentials = await createUserWithEmailAndPassword(auth, email, password)
    console.log("USER CREATED!")
    console.log(userCredentials);
    res.status(200).json(userCredentials);
};

module.exports = {
    singupWithEmail
};