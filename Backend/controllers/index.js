var Content = require("../models/Content");

/// This method list all contents
exports.getAll = (req, res, next) => {
    Content.find().then((contents) => {
        res.status(200).json(contents);
    });
}

/// This method add a new content
exports.add = (req, res, next) => {
    new Content({
        contentType: req.body.contentType,
        contentUrl: req.body.contentUrl
    }).save().then(() => {
        res.status(201).json("Successful!");
    }).catch((err) => {
        res.json("Error");
    });
}