const firestoreClientLib = require("firebase/firestore");
const {firebase} = require("../config/firebase-client-config.js");

const {firebaseAdmin} = require("../config/firebase-config.js");

const httpStatus = require("http-status-codes");

const getOne = async (req, res) => {
    const id = req.uid;
    
    //Firestore
    const db = firestoreClientLib.getFirestore(firebase);
    const docSnapshot = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "pharmacists", id));
    const info = {
        firstName,
        lastName,
        pharmacyID
    } = docSnapshot.data();
    info.email = req.email;
    res.status(httpStatus.StatusCodes.OK).json(info);
};

const patchOne = async (req, res) => {
    const id = req.uid;
    const {
        newPassword,
        newFirstName,
        newLastName
    } = req.body;

    //Firebase auth & store
    const fireAdmin = firebaseAdmin.auth(firebaseAdmin);
    const db = firestoreClientLib.getFirestore(firebase);
    if (newPassword) {
        fireAdmin.updateUser(id, {
            password: newPassword
        });
    }
    if (newFirstName) {
        const userSnapshot = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "pharmacists", id));
        fireAdmin.updateUser(id, {
            displayName: (newFirstName + userSnapshot.data().lastName)
        });
        await firestoreClientLib.updateDoc(firestoreClientLib.doc(db, "pharmacists", id), {
            firstName: newFirstName
        });
    }
    if (newLastName) {
        const userSnapshot = await firestoreClientLib.getDoc(firestoreClientLib.doc(db, "pharmacists", id));
        fireAdmin.updateUser(id, {
            displayName: (userSnapshot.data().firstName + newLastName)
        });
        await firestoreClientLib.updateDoc(firestoreClientLib.doc(db, "pharmacists", id), {
            lastName: newLastName
        });
    }
    getOne(req, res);
};

module.exports = {
    getOne,
    patchOne
};