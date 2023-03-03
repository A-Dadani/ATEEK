const express = require("express");
const router = express.Router();

const {authMiddleware} = require("../middleware/auth-middleware");
const controller = require("../controllers/pharmacists");

router.route("/u/:id").get(authMiddleware, controller.getOne).patch(authMiddleware, controller.patchOne);

module.exports = router;