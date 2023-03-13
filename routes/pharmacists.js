const express = require("express");
const router = express.Router();

const {authMiddleware} = require("../middleware/auth-middleware.js");
const controller = require("../controllers/pharmacists.js");

router.route("/u/:id").get(controller.getOne).patch(authMiddleware, controller.patchOne);
router.route("/profile").get(authMiddleware, controller.getOnePRVT);

module.exports = router;