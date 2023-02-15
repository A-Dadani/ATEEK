const express = require("express");
const router = express.Router();
const {signupWithEmail} = require("../controllers/auth.js");

router.route("/signup").post(signupWithEmail);

module.exports = router;