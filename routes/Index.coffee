module.exports = 

	get: (req, res) ->
		res.render 'login/index', {message:''}
		
	get_success: (req, res) ->
		res.redirect 'index'	