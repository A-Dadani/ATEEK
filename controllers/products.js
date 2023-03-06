const firestoreClientLib = require("firebase/firestore");
const {firebase} = require("../config/firebase-client-config.js");

const {processProduct} = require("../middleware/multipart-handler.js");
const httpStatus = require("http-status-codes");
const errors = require("../errors");

const addOne = async (req, res) => {
    const {
        name,
        priceDH,
        description,
        qty
    } = req.body;
    regexFloat = /^-?\d*\.?\d+$/;
    regexInt = /^[0-9]+$/;
    if (!name || !priceDH || !description || !qty) {
        throw new errors.BadRequestError("Please provide all required info");
    }
    if (!priceDH.match(regexFloat) || !qty.match(regexInt)) {
        throw new errors.BadRequestError("Malformated request!");
    }

    //Firebase
    const db = firestoreClientLib.getFirestore(firebase);
    //Get ID of pharmacy and of owner
    const uid = req.uid;
    const userSnapshot = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "pharmacists", uid));
    const pid = userSnapshot.data().pharmacyID;
    const prodDocRef = await firestoreClientLib.addDoc(firestoreClientLib.collection(db, "products"), {
        name,
        description,
        priceDH,
        qty,
        ownerID: uid,
        prodDocRef: pid
    });
    res.status(httpStatus.StatusCodes.OK).json({id: prodDocRef.id})
};

const patchOne = async (req, res) => {
    const uid = req.uid;
    const prid = req.params.id;
    const db = firestoreClientLib.getFirestore(firebase);
    const prSnapshot = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "products", prid));
    if (uid != prSnapshot.data().ownerID) {
        throw new errors.UnauthenticatedError("Unauthorized!");
    }
    const {
        name,
        priceDH,
        description,
        qty
    } = req.body;

    regexFloat = /^-?\d*\.?\d+$/;
    regexInt = /^[0-9]+$/;
    if ((priceDH && !priceDH.match(regexFloat))
        || (qty && !qty.match(regexInt))) {
        throw new errors.BadRequestError("Malformated request!");        
    }
    const newInfo = {
        ...(name ? {name} : {}),
        ...((typeof priceDH !== "undefined") ? {priceDH} : {}),
        ...(description ? {description} : {}),
        ...((typeof qty !== "undefined") ? {qty} : {})
    };
    await firestoreClientLib.updateDoc(firestoreClientLib.doc(db, "products", prid), newInfo);
    res.status(httpStatus.StatusCodes.OK).send("Product patched successfully.");
};

const getOne = async (req, res) => {
    const prid = req.params.id;
    const db = firestoreClientLib.getFirestore(firebase);
    const docSnapshot = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "products", prid));
    if (!docSnapshot.exists()) {
        throw new errors.BadRequestError("Requested ID doesn\'t exist.");
    }
    res.status(httpStatus.StatusCodes.OK).json({ID: docSnapshot.id, ...docSnapshot.data()});
};

module.exports = {
    patchOne,
    getOne,
    addOne
};