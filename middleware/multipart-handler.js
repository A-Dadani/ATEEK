// import the multer module before configuring it to use the disc storage engine
const util = require("util");
const multer = require("multer");
const fs  = require("fs");

const errors = require("../errors");

const maxSize = 2 * 1024 * 1024;
const acceptableFileMIMETypes = ["image/jpeg", "image/png", "image/webp", "application/pdf"];

const storage = multer.diskStorage({
  destination: (req, file, cb) => {
    if (!fs.existsSync(__basedir + "/resources/temp/")) {
      fs.mkdirSync(__basedir + "/resources/temp/", {recursive: true});
    }
    cb(null, __basedir + "/resources/temp/");
  },
  filename: (req, file, cb) => {
    cb(null, file.fieldname + "." + file.mimetype.split('/')[1]);
  },
});

const fileFilter = function (req, file, cb) {
    if ((file.fieldname === "userAvatar" || file.fieldname === "legalDocs")
        && acceptableFileMIMETypes.includes(file.mimetype)
        && !(file.fieldname === "userAvatar" && file.mimetype === "application/pdf")) {
            cb(null, true);
    } else {
        cb(new errors.BadRequestError("Both files are required, and must be JPEG, PNG, WEBP. Legal documents can also be PDF."));
    }
};

const handleRequest = multer({
    storage: storage,
    limits: {
        fileSize: maxSize,
        files: 2
    },
    fileFilter: fileFilter
}).any();

// create the exported middleware object
module.exports = util.promisify(handleRequest);