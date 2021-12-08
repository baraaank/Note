var mongoose = require("mongoose")
var Schema = mongoose.Schema

var note = new Schema({

    note: String,
    title: String,
    date: String

})


const Data = mongoose.model("Data", note)

module.exports = Data