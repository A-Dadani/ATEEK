const express = require("express");
const router = express.Router();

const controller = require("../controllers/pharmacies.js");

router.route("/getNearby/pinpoint").get(controller.getNearbyPharmaciesPP);
router.route("/getNearby/engarde/pinpoint").get(controller.getNearbyEnGardePP);
router.route("/getAll/engarde").get(controller.getAllEnGarde);
router.route("/getAll").get(controller.getAll);

module.exports = router;