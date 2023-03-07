const express = require("express");
const router = express.Router();

const {authMiddleware} = require("../middleware/auth-middleware.js");
const controller = require("../controllers/pharmacies.js");

router.route("/getNearby/pinpoint").get(controller.getNearbyPharmaciesPP);
router.route("/getNearby/engarde/pinpoint").get(controller.getNearbyEnGardePP);
router.route("/getAll/engarde").get(controller.getAllEnGarde);
router.route("/getAll").get(controller.getAll);
router.route("/:id").get(controller.getOne).patch(authMiddleware, controller.patchOne);
router.route("/:id/allProducts").get(controller.getAllProducts);

module.exports = router;