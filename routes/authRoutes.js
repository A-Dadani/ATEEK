const express = require("express");
const router = express.Router();
const { signupWithEmail,
        signinWithEmail,
        signOutUser,
        getAuthStatus } = require("../controllers/auth.js");

router.route("/signup").post(signupWithEmail);
router.route("/signin").post(signinWithEmail);
router.route("/signout").post(signOutUser);
router.route("/authStatus").get(getAuthStatus);

module.exports = router;