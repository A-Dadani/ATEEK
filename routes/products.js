const express = require("express");
const router = express.Router();

const {authMiddleware} = require("../middleware/auth-middleware.js");
const controller = require("../controllers/products.js");

router.route("/:id").get(controller.getOne).patch(authMiddleware, controller.patchOne);

module.exports = router;