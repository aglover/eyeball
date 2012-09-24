models = require '../models/Models'
mongoose = require 'mongoose'

# new
# passport = require 'passport'
# end new

module.exports = (passport) ->
	
	post: (req, res) ->
		# console.log "post was executed for login! with #{req.body.username} and #{req.body.password}"
		res.render 'index', {account_token: 'xxxx'}
	# post: (req, res) ->
	# 		console.log "post was executed for login! with #{req.body.username}"
	# 		models.Account.findOne username: req.body.username, (err, document) ->
	# 			if err
	# 				res.send "eerr!!!"
	# 			if !document
	# 				res.render 'login/index', {message: 'Unknown user'}
	# 			else
	# 				if document.password is req.body.password
	# 					console.log "document was found forwarding #{document._id}"
	# 					res.render 'index', {account_token: document._id}
	# 				else
	# 					res.render 'login/index', {message: 'Invalid password'}
	

	get: (req, res) ->
		res.render 'login/index', {message:req.flash('error')}