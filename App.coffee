express = require 'express'
pipeline = require 'connect-assets'
mongoose = require 'mongoose'

app = express express.logger() 
app.use express.bodyParser()
app.use pipeline()

models = require './models/Models'
index_routes = require './routes/Index'
account_routes = require './routes/Account'
login_routes = require './routes/Login'


app.set 'view engine', 'jade'
app.use '/images', express.static(__dirname + '/public/images')
app.use '/js', express.static(__dirname + '/public/js')
app.use '/style', express.static(__dirname + '/public/style')

app.get '/', index_routes.get
app.get '/index', index_routes.get_success
app.post '/login/login', login_routes.post
app.get '/login/index', login_routes.get
app.get '/account/create', account_routes.get
app.post '/account/create', account_routes.post


port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"