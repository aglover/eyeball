module.exports = 

	get: (req, res) ->
		res.redirect 'login/index'
		
	get_success: (req, res) ->
		res.redirect 'index'	