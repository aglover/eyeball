module.exports = 

	get: (req, res) ->
		res.render 'login/index', {message:''}
		
	get_success: (req, res) ->
		console.log "redirect to index! via get_success"
		res.redirect 'index'	