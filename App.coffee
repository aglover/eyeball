express = require 'express'
pipeline = require 'connect-assets'
mongoose = require 'mongoose'

# new
passport = require 'passport'
LocalStrategy = require('passport-local').Strategy
# end new

app = express express.logger() 
app.use express.bodyParser()
app.use pipeline()

# new
app.use express.errorHandler({ dumpExceptions: true, showStack: true })
app.use express.cookieParser()
app.use express.session({ secret: 'my secret' })
app.use passport.initialize()
app.use passport.session()
# end new

app.set 'view engine', 'jade'
app.use '/images', express.static(__dirname + '/public/images')
app.use '/js', express.static(__dirname + '/public/js')
app.use '/style', express.static(__dirname + '/public/style')

models = require './models/Models'


# new 
passport.use new LocalStrategy (username, password, done) ->
	console.log "LocalStrategy has been invoked!"
	models.Account.findOne { username: username }, (err, user) ->
		if (err)
			return done(err)
		if (!user) 
			return done(null, false, { message: 'Unknown user' })
		if (!user.validPassword(password))
			return done(null, false, { message: 'Invalid password' })
		return done(null, user)
		
passport.serializeUser (user, done) ->
	done(null, user.id)

passport.deserializeUser (id, done) ->
	models.Account.findOne id, (err, user) ->
		done(err, user)
		
# end new

index_routes = require './routes/Index'
account_routes = require './routes/Account'
login_routes = require('./routes/Login')(passport)
server_routes = require './routes/Server'

app.get '/', index_routes.get
app.get '/index', index_routes.get_success
app.post '/login/login', login_routes.post
app.get '/login/index', login_routes.get
app.get '/account/create', account_routes.get
app.post '/account/create', account_routes.post
app.post '/server/create', server_routes.post

port = process.env.PORT or 3000

app.listen port, ->
	console.log "listening on #{port}"