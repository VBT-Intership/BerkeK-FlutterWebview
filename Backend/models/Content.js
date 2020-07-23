var mongoose = require("mongoose");

var Schema = mongoose.Schema;

var contentSchema = new Schema({
    contentType: String,
    contentUrl: String
});

module.exports = mongoose.model("content", contentSchema);