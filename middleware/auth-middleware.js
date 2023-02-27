const {firebaseAdmin} = require("../config/firebase-config.js");
const errors = require("../errors");

const authMiddleware = async (req, res, next) => {
    if (!req.cookies || !req.cookies.session) {
        throw new errors.UnauthenticatedError("Unauthorized!")
    }
    //Firebase auth
    const fireAdmin = firebaseAdmin.auth(firebaseAdmin);
    try {
        const decodedClaims = await fireAdmin.verifySessionCookie(sessionCookie, true);
        req.uid = decodedClaims.user_id;
        req.displayName = decodedClaims.name;
        req.email = decodedClaims.email;
        next();
    } catch (err) {
        throw new errors.UnauthenticatedError("Unauthorized!");
    }
};

module.exports = {
    authMiddleware
}