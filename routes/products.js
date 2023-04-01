const express = require("express");
const router = express.Router();

const {authMiddleware} = require("../middleware/auth-middleware.js");
const controller = require("../controllers/products.js");

router.route("/:id").get(controller.getOne)
                    .patch(authMiddleware, controller.patchOne)
router.route("/").post(authMiddleware, controller.addOne);
//Get all products is in the pharmacies files.

module.exports = router;