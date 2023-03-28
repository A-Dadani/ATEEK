const firestoreClientLib = require("firebase/firestore");
const {firebase} = require("../config/firebase-client-config.js");

const errors = require("../errors")
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
        finalResponse.push({ID: doc.id,
            pharmacyAddressLN1: doc.data().pharmacyAddressLN1,
            pharmacyAddressLN2: doc.data().pharmacyAddressLN2,
            ownerID: doc.data().ownerID,
            enGarde: doc.data().enGarde,
            city: doc.data().city,
            name: doc.data().name,
            phoneNo: doc.data().phoneNo,
            countryCode: doc.data().countryCode,
            postalCode: doc.data().postalCode,
            latitude: doc.data().geoLoc['latitude'],
            longitude: doc.data().geoLoc['longitude']
        });
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
        finalResponse.push({ID: doc.id,
            pharmacyAddressLN1: doc.data().pharmacyAddressLN1,
            pharmacyAddressLN2: doc.data().pharmacyAddressLN2,
            ownerID: doc.data().ownerID,
            enGarde: doc.data().enGarde,
            city: doc.data().city,
            name: doc.data().name,
            phoneNo: doc.data().phoneNo,
            countryCode: doc.data().countryCode,
            postalCode: doc.data().postalCode,
            latitude: doc.data().geoLoc['latitude'],
            longitude: doc.data().geoLoc['longitude']
        });
    });
    res.status(httpStatus.StatusCodes.OK).json(finalResponse);
};

const getOne = async (req, res) => {
    const id = req.params.id;
    const db = firestoreClientLib.getFirestore(firebase);
    const doc = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "pharmacies", id));
    if (!doc.exists()) {
        throw new errors.BadRequestError("Requested ID doesn\'t exist.");
    }
    res.status(httpStatus.StatusCodes.OK).json({
        pharmacyAddressLN1: doc.data().pharmacyAddressLN1,
        pharmacyAddressLN2: doc.data().pharmacyAddressLN2,
        ownerID: doc.data().ownerID,
        enGarde: doc.data().enGarde,
        city: doc.data().city,
        name: doc.data().name,
        phoneNo: doc.data().phoneNo,
        countryCode: doc.data().countryCode,
        postalCode: doc.data().postalCode,
        latitude: doc.data().geoLoc['latitude'],
        longitude: doc.data().geoLoc['longitude']
    });
};

const patchOne = async (req, res) => {
    //Init firstore
    const db = firestoreClientLib.getFirestore(firebase);
    const uid = req.uid;
    const pid = req.params.id;
    const pSnapshot = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "pharmacies", pid));

    if (!pSnapshot.exists()) {
        throw new errors.BadRequestError("Requested ID doesn\'t exist.");
    }

    if (uid != pSnapshot.data().ownerID) {
        throw new errors.UnauthenticatedError("Unauthorized!");
    }

    const {
        pharmacyPhoneNO,
        pharmacyAddressLN1,
        pharmacyAddressLN2,
        city,
        postalCode,
        countryCode,
        latGeoLoc,
        longGeoLoc,
        pharmacyName,
        isGarde
    } = req.body;

    //Check data
    const regexPhoneNo = /^\+?\d{8,15}$/;
    const regexGeoLoc = /^-?\d*\.?\d+$/;
    if ((pharmacyPhoneNO && !pharmacyPhoneNO.match(regexPhoneNo))
        || (latGeoLoc && !latGeoLoc.match(regexGeoLoc))
        || (longGeoLoc && !latGeoLoc.match(regexGeoLoc))) {
        throw new errors.BadRequestError("Malformated request!");
    }
    if ((latGeoLoc && !longGeoLoc) || (!latGeoLoc && longGeoLoc)) {
        throw new errors.BadRequestError("Please provide both a longitude and a latitude value or none.");
    }

    const coords = (latGeoLoc ? new firestoreClientLib.GeoPoint(parseFloat(latGeoLoc), parseFloat(longGeoLoc)) : {});
    const newInfo = {
        ...(pharmacyPhoneNO ? {phoneNo: pharmacyPhoneNO} : {}),
        ...(pharmacyAddressLN1 ? {pharmacyAddressLN1} : {}),
        ...(pharmacyAddressLN2 ? {pharmacyAddressLN2} : {}),
        ...(city ? {city} : {}),
        ...(postalCode ? {postalCode} : {}),
        ...(countryCode ? {countryCode} : {}),
        ...(Object.keys(coords).length ? {geoLoc: coords} : {}),
        ...(pharmacyName ? {name: pharmacyName} : {}),
        ...((typeof isGarde !== "undefined") ? {enGarde: isGarde} : {})
    };
    await firestoreClientLib.updateDoc(firestoreClientLib.doc(db, "pharmacies", pid), newInfo);
    res.status(httpStatus.StatusCodes.OK).send("Successfully updated the pharmacy!");
};

const getAllProducts = async (req, res) => {
    const pid = req.params.id;
    const db = firestoreClientLib.getFirestore(firebase);
    const query = firestoreClientLib.query(firestoreClientLib.collection(db, "products"), 
                                            firestoreClientLib.where("pharmacyID", "==", pid));
    const productsSnapshot = await firestoreClientLib.getDocs(query);
    let finalResponse = [];
    productsSnapshot.forEach((doc) => {
        finalResponse.push({productID: doc.id, ...doc.data()});
    });
    res.status(httpStatus.StatusCodes.OK).json(finalResponse);
};

module.exports = {
    getNearbyPharmaciesPP,
    getNearbyEnGardePP,
    getAllEnGarde,
    getAll,
    getOne,
    patchOne,
    getAllProducts
};