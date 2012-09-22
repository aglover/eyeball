module.exports =
	
	get: (req, res) ->
		res.render 'account/index'
	
	post: (req, res) ->
		console.log "account create with params: #{req.body}"
		username = req.body.username
		password = req.body.password
		password_2 = req.body.password_2
		console.log "username is #{username}, password is #{password} and match password is #{password_2}"