express = require 'express'

app = express(express.logger())
app.use express.bodyParser()

app.set 'view engine', 'jade'
app.use '/images', express.static(__dirname + '/images')
app.use '/js', express.static(__dirname + '/js')
app.use '/style', express.static(__dirname + '/style')

app.get '/', (req, res) ->
	res.render 'index'


port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"