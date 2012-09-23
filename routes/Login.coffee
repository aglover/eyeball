models = require '../models/Models'
mongoose = require 'mongoose'

module.exports = 
	
	post: (req, res) ->
		console.log "post was executed for login! with #{req.body.username}"
		models.Account.findOne username: req.body.username, (err, document) ->
			if err
				res.send "eerr!!!"
			if !document
				res.send "user not found"
			else
				if document.password is req.body.password
					res.render 'index'
				else
					res.send "nope!"
		# res.send "test"

	get: (req, res) ->
		res.render 'login/index'