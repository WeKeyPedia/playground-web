fs          = require('fs')
express     = require('express')
app         = express()
port        = process.env.PORT or 3000
server      = app.listen port
# io          = require('socket.io').listen server

app.configure ->
  app.use express.bodyParser()
  app.use express.static(__dirname + "/_public")

app.get '*',(req, res)->
  file = fs.createReadStream __dirname + "/_public/index.html"
  res.writeHead 200,
    'Content-Type': 'text/html'

  file.on 'data', res.write.bind(res)

  file.on 'close', ()->
    res.end()