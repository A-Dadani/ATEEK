const firestoreClientLib = require("firebase/firestore");
const {firebase} = require("../config/firebase-client-config.js");

const httpStatus = require("http-status-codes");

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
    getOne
};