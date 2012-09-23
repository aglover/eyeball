mongoose = require 'mongoose'

mongoose.connect "mongodb://magnus:magnus@flame.mongohq.com:27054/magnus"

Account = mongoose.model 'account', new mongoose.Schema({
	username: {type: String, trim:true, required: true},
	password : {type: String, trim:true, required: true}
})

exports.Account = Account
