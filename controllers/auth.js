const {firebase} = require("../config/firebase-client-config.js");
const firestoreClientLib = require("firebase/firestore");

const {firebaseAdmin} = require("../config/firebase-config.js");
const {apiKey} = require("../config/client-config.json");

const fs = require("fs");
const path = require("path");
const {processReq} = require("../middleware/multipart-handler.js");

const axios = require("axios");

const errors = require("../errors");
const httpStatus = require("http-status-codes");

const signupWithEmail = async (req, res) => {
    //Check if user is signed in
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
    const isGarde = req.body.isGarde || false; //optional defaults to false

    //Check data
    const regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    const regexPass = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,20}$/;
    const regexPhoneNo = /^\+?\d{8,15}$/;
    const regexName = /^[a-zA-Z]{1,20}$/;
    const regexGeoLoc = /^-?\d*\.?\d+$/;

    //-->Email & password
    if (!email || !password) {
        throw new errors.BadRequestError("Please provide both an Email and a password.");
    }
    if (!email.match(regexEmail)) {
        throw new errors.BadRequestError("Please provide a valid email adress.");
    }
    if (!password.match(regexPass)) {
        throw new errors.BadRequestError("Password must be between 8 and 20 characters long and contain at least one uppercase and one lowercase letter and one number.");
    }
    //-->other stuff    
    if (!firstName || !lastName || !pharmacyPhoneNO
        || !latGeoLoc || !longGeoLoc || !pharmacyName
        || !cityName || !postalCode || !countryCode || (req.files.length != 2)) {
        throw new errors.BadRequestError("Please provide all required information.");
    }
    if (!pharmacyPhoneNO.match(regexPhoneNo)) {
        throw new errors.BadRequestError("Please make sure the pharmacy number is in the correct format.");
    }
    if (!firstName.match(regexName)) {
        throw new errors.BadRequestError("Please make sure the first name is in the correct format.");
    }
    if (!lastName.match(regexName)) {
        throw new errors.BadRequestError("Please make sure the first name is in the correct format.");
    }
    if (!latGeoLoc.match(regexGeoLoc) || !longGeoLoc.match(regexGeoLoc)) {
        throw new errors.BadRequestError("Please make sure the geolocalization is in the correct format.");
    }

    //Firebase auth & store
    const fireAdmin = firebaseAdmin.auth(firebaseAdmin);
    const db = firestoreClientLib.getFirestore(firebase);
    //-->Add user to firebase Auth
    const displayName = firstName + " " + lastName;
    const user = await fireAdmin.createUser({
        email,
        password,
        displayName
    });
    //-->Authorizing user
    //---->Get IDTOKEN
    const response = await axios.post(`https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${apiKey}`, {
        email: email,
        password: password,
        returnSecureToken: true
    });
    //---->Create session cookie
    const expiresIn = 60 * 60 * 24 * 5 * 1000;
    const sessionCookie = await fireAdmin.createSessionCookie(response.data.idToken, {expiresIn});
    const options = { maxAge: expiresIn, httpOnly: true, secure: true };
    res.cookie('session', sessionCookie, options);
    //-->Upload data to firestore
    //---->Pharmacy Data
    const coords = new firestoreClientLib.GeoPoint(parseFloat(latGeoLoc), parseFloat(longGeoLoc));
    const pharmacyDocRef = await firestoreClientLib.addDoc(firestoreClientLib.collection(db, "pharmacies"), {
        ownerID: user.uid,
        phoneNo: pharmacyPhoneNO,
        geoLoc: coords,
        name: pharmacyName,
        pharmacyAddressLN1: pharmacyAddressLN1,
        pharmacyAddressLN2: pharmacyAddressLN2,
        city: cityName,
        postalCode: postalCode,
        countryCode: countryCode,
        enGarde: isGarde
    });
    //---->Personal Data
    const pharmacistDocRef = await firestoreClientLib.setDoc(firestoreClientLib.doc(db, "pharmacists", user.uid), {
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
    res.status(httpStatus.StatusCodes.CREATED).send(`User registered successfully`);
};

const signinWithEmail = async (req, res) => {
    //Check if user is already signed in
    if (req.cookies && req.cookies.session) {
        throw new errors.BadRequestError("A user is already signed in.");
    }

    //Parse data
    const { email,
            password } = req.body;
            
    //Regex
    const regexEmail = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
    

    //-->Check if user already logged in
    if (!email || !password) {
        throw new errors.BadRequestError("Please provide both an email and a password.");
    }
    if (!email.match(regexEmail)) {
        throw new errors.BadRequestError("Please provide a valid email.");
    }

    //Get IDTOKEN
    const response = await axios.post(`https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=${apiKey}`, {
        email: email,
        password: password,
        returnSecureToken: true
    });
    
    //Create session cookie
    const fireAdmin = firebaseAdmin.auth(firebaseAdmin);
    const expiresIn = 60 * 60 * 24 * 5 * 1000;
    const sessionCookie = await fireAdmin.createSessionCookie(response.data.idToken, {expiresIn});
    const options = { maxAge: expiresIn, httpOnly: true, secure: true };
    res.cookie('session', sessionCookie, options);

    return res.status(httpStatus.StatusCodes.OK).send("User signed in successfully.");
};

const signOutUser = async (req, res) => {
    if (!req.cookies || !req.cookies.session) {
        throw new errors.BadRequestError("No user is signed in.");
    }
    const sessionCookie = req.cookies.session;
    //Firebase auth
    const fireAdmin = firebaseAdmin.auth(firebaseAdmin);
    res.clearCookie('session');
    try {
        const decodedClaims = await fireAdmin.verifySessionCookie(sessionCookie);
        fireAdmin.revokeRefreshTokens(decodedClaims.sub);
        return res.status(httpStatus.StatusCodes.OK).send("User signed out successfully");
    } catch (err) {
        return res.status(httpStatus.StatusCodes.BadRequestError).send("Cookie isn\'t valid, no user is signed in.");
    }
};

//to do: fix err message
const getAuthStatus = async (req, res) => {
    const sessionCookie = req.cookies.session;
    //Firebase auth
    const fireAdmin = firebaseAdmin.auth(firebaseAdmin);
    const decodedClaims = await fireAdmin.verifySessionCookie(sessionCookie, true);
    res.status(httpStatus.StatusCodes.OK).send("A user is signed in");
};

module.exports = {
    signupWithEmail,
    signinWithEmail,
    signOutUser,
    getAuthStatus
};