express = require 'express'
pipeline = require 'connect-assets'

account_routes = require './routes/Account'

app = express(express.logger())
app.use express.bodyParser()
app.use pipeline()

app.set 'view engine', 'jade'
app.use '/images', express.static(__dirname + '/public/images')
app.use '/js', express.static(__dirname + '/public/js')
app.use '/style', express.static(__dirname + '/public/style')

app.get '/', (req, res) ->
	res.redirect '/login'

app.post '/login', (req, res) ->
	# res.render 'login'

app.get '/login', (req, res) ->
	res.render 'login'

app.get '/account/create', account_routes.get
app.post '/account/create', account_routes.post


port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"