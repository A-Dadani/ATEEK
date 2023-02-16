const fireauthLib = require("firebase/auth");
const firestoreLib = require("firebase/firestore");
const {firebase} = require("../config/firebase-config.js");
const {BadRequestError} = require("../errors");
const util = require("util");

const fs = require("fs");
const path = require("path");
const processReq = require("../middleware/multipart-handler.js");

const signupWithEmail = async (req, res) => {
    await processReq(req, res);

    //Parse data
    //-->Personal data
    const email = req.body.email;
    const password = req.body.password;
    const firstName = req.body.firstName;
    const lastName = req.body.lastName;
    //-->Pharmacy data
    const pharmacyPhoneNO = req.body.pharmacyPhoneNO;
    const pharmacyAddressLN1 = req.body.pharmacyAddressLN1;
    const pharmacyAddressLN2 = req.body.pharmacyAddressLN2 || ""; //optional
    const cityName = req.body.city;
    const postalCode = req.body.postalCode;
    const countryCode = req.body.countryCode;
    const latGeoLoc = req.body.latGeoLoc;
    const longGeoLoc = req.body.longGeoLoc;
    const pharmacyName = req.body.pharmacyName;

    //Check data
    const regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    const regexPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/;
    const regexPhoneNo = /^\+?\d{8,15}$/;
    const regexName = /^[a-zA-Z]{1,20}$/;
    const regexGeoLoc = /^-?\d*\.?\d+$/;

    //-->Email & password
    if (!email || !password) {
        throw new BadRequestError("Please provide both an Email and a password.");
    }
    if (!email.match(regexEmail)) {
        throw new BadRequestError("Please provide a valid email adress.");
    }
    if (!password.match(regexPass)) {
        throw new BadRequestError("Password must be between 8 and 20 characters long and contain at least one uppercase and one lowercase letter and one number.");
    }
    //-->other stuff
    if (!firstName || !lastName || !pharmacyPhoneNO
        || !latGeoLoc || !longGeoLoc || !pharmacyName
        || !cityName || !postalCode || !countryCode || (req.files.length != 2)) {
        throw new BadRequestError("Please provide all required information.");
    }
    if (!pharmacyPhoneNO.match(regexPhoneNo)) {
        throw new BadRequestError("Please make sure the pharmacy number is in the correct format.");
    }
    if (!firstName.match(regexName)) {
        throw new BadRequestError("Please make sure the first name is in the correct format.");
    }
    if (!lastName.match(regexName)) {
        throw new BadRequestError("Please make sure the first name is in the correct format.");
    }
    if (!latGeoLoc.match(regexGeoLoc) || !longGeoLoc.match(regexGeoLoc)) {
        throw new BadRequestError("Please make sure the geolocalization is in the correct format.");
    }

    //Firebase auth & store
    const auth = fireauthLib.getAuth(firebase); 
    const db = firestoreLib.getFirestore(firebase);
    //-->Add user to firebase Auth
    const displayName = firstName + " " + lastName;
    const {user} = await fireauthLib.createUserWithEmailAndPassword(auth, email, password);
    await fireauthLib.updateProfile(user, {
        displayName: displayName
    });
    //-->Upload data to firestore
    //---->Pharmacy Data
    const coords = new firestoreLib.GeoPoint(parseFloat(latGeoLoc), parseFloat(longGeoLoc));
    const pharmacyDocRef = await firestoreLib.addDoc(firestoreLib.collection(db, "pharmacies"), {
        ownerID: user.uid,
        phoneNo: pharmacyPhoneNO,
        geoLoc: coords,
        name: pharmacyName,
        pharmacyAddressLN1: pharmacyAddressLN1,
        pharmacyAddressLN2: pharmacyAddressLN2,
        city: cityName,
        postalCode: postalCode,
        countryCode: countryCode
    });
    //---->Personal Data
    const pharmacistDocRef = await firestoreLib.setDoc(firestoreLib.doc(db, "pharmacists", user.uid), {
        pharmacyID: pharmacyDocRef.id,
        firstName: firstName,
        lastName: lastName
    });

    const tempDIR = path.normalize(__basedir + "/resources/temp");
    const avatarDIR = path.normalize(__basedir + `/resources/users/${user.uid}/avatar`);
    const legalDocsDIR = path.normalize(__basedir + `/resources/users/${user.uid}/legalDocs`);

    if (!fs.existsSync(avatarDIR)) fs.mkdirSync(avatarDIR, {recursive: true});
    if (!fs.existsSync(legalDocsDIR)) fs.mkdirSync(legalDocsDIR, {recursive: true});
    fs.readdir(tempDIR, (err, files) => {
        files.forEach(file => {
            if (file.split('.')[0] == "legalDocs") {
                fs.rename(path.join(tempDIR, file), path.join(legalDocsDIR, file), function (err) {
                    if (err) throw err;
                    console.log("Successfully moved legalDocs");
                });
            } else if (file.split('.')[0] == "userAvatar") {
                fs.rename(path.join(tempDIR, file), path.join(avatarDIR, file), function (err) {
                    if (err) throw err;
                    console.log("Successfully moved avatar");
                });
            }
        });
    });
    res.status(200).json(user);
};

module.exports = {
    signupWithEmail
};