var mongoose = require("mongoose");

module.exports = () => {
    const uri = "mongodb://127.0.0.1:27017/FlutterWebviewDatabase";
    mongoose.connect(uri, { useUnifiedTopology: true, useNewUrlParser: true });

    mongoose.connection.on('open', () => {
        console.log('MongoDB: Connected');
    });
    mongoose.connection.on('error', (err) => {
        console.log('MongoDB: Error', err);
    });

    mongoose.Promise = global.Promise;
}
