const express = require("express");
const router = express.Router();
const {singupWithEmail} = require("../controllers/auth.js");

router.route("/signup").post(singupWithEmail);

module.exports = router;