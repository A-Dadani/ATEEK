const firebaseAdmin = require("firebase-admin");
const serviceAccount = require("./service_account.json");

// Initialize Firebase
firebaseAdmin.initializeApp({
    credential: firebaseAdmin.credential.cert(serviceAccount),
    databaseURL: 'https://ateek-dev-v0.firebaseio.com'
});

module.exports = {firebaseAdmin};