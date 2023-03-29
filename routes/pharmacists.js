const express = require("express");
const router = express.Router();

const {authMiddleware} = require("../middleware/auth-middleware.js");
const controller = require("../controllers/pharmacists.js");

router.route("/u/:id").get(controller.getOne);
router.route("/profile").get(authMiddleware, controller.getOnePRVT).patch(authMiddleware, controller.patchOne);

module.exports = router;