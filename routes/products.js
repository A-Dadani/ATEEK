const express = require("express");
const router = express.Router();

const controller = require("../controllers/products.js");

router.route("/:id").get(controller.getOne).patch(controller.patchOne);

module.exports = router;