const {getDistance} = require("../helpers/distance");

const firestoreClientLib = require("firebase/firestore");
const {firebase} = require("../config/firebase-client-config.js");
const httpStatus = require("http-status-codes");

const getNearbyPharmaciesPP = async (req, res) => {
    const geoLong = req.query.long;
    const geoLat = req.query.lat;
    
    res.status(200).end("DONE");
};

const getNearbyEnGardePP = async (req, res) => {
    const geoLong = req.query.long;
    const geoLat = req.query.lat;
};

const getAllEnGarde = async (req, res) => {
    const db = firestoreClientLib.getFirestore(firebase);
    const query = firestoreClientLib.query(firestoreClientLib.collection(db, "pharmacies"), 
                                            firestoreClientLib.where("enGarde", "==", true));
    const allPharmsSnapshot = await firestoreClientLib.getDocs(query);
    let finalResponse = [];
    allPharmsSnapshot.forEach((doc) => {
        finalResponse.push(doc.data());
    });
    res.status(httpStatus.StatusCodes.OK).json(finalResponse);
};

const getAll = async (req, res) => {
    const db = firestoreClientLib.getFirestore(firebase);
    const query = firestoreClientLib.query(firestoreClientLib.collection(db, "pharmacies"), 
                                            firestoreClientLib.where("ownerID", "!=", ""));
    const allPharmsSnapshot = await firestoreClientLib.getDocs(query);
    let finalResponse = [];
    allPharmsSnapshot.forEach((doc) => {
        finalResponse.push(doc.data());
    });
    res.status(httpStatus.StatusCodes.OK).json(finalResponse);
};

const getOne = async (req, res) => {
    const id = req.query.id;
    const db = firestoreClientLib.getFirestore(firebase);
    const docSnapshot = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "pharmacies", id));
    res.status(httpStatus.StatusCodes.OK).json(docSnapshot.data());
};

module.exports = {
    getNearbyPharmaciesPP,
    getNearbyEnGardePP,
    getAllEnGarde,
    getAll,
    getOne
};