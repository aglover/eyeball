module.exports =
	
	get: (req, res) ->
		res.render 'account/index'
	
	post: (req, res) ->
		username = req.body.username
		password = req.body.password
		password_2 = req.body.password_2
		if password isnt password_2
			res.render 'account/index'
		else
			console.log "username is #{username}, password is #{password} and match password is #{password_2}"
			res.render 'login/index'