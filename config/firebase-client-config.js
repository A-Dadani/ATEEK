const { initializeApp } = require("firebase/app");

const firebaseConfig = {
    apiKey: "AIzaSyDdqtgGwTuwJEsvzWGRgg82tSFPsbBdSKw",
    authDomain: "ateek-dev-v0.firebaseapp.com",
    projectId: "ateek-dev-v0",
    storageBucket: "ateek-dev-v0.appspot.com",
    messagingSenderId: "227909093468",
    appId: "1:227909093468:web:cd9a2cbbfd345c374c7e99"
};

// Initialize Firebase
const firebase = initializeApp(firebaseConfig);

module.exports = {firebase};