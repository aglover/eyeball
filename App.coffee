express = require 'express'


app = express(express.logger())
app.use express.bodyParser()
app.use require('connect-assets')()

app.set 'view engine', 'jade'
app.use '/images', express.static(__dirname + '/public/images')
app.use '/js', express.static(__dirname + '/public/js')
app.use '/style', express.static(__dirname + '/public/style')

app.get '/', (req, res) ->
	res.render 'index'


port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"