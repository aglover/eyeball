module.exports = 
	post: (req, res) ->
		name = req.body.name
		url = req.body.url
		port = req.body.port
		account_id = req.body.account_token
		console.log "attrs are name #{name}, url #{url}, port #{port}, token #{account_id}"