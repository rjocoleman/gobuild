async   = require("async")
coffee  = require("coffee-script")
dd      = require("./lib/dd")
express = require("express")
log     = require("./lib/logger").init("gobuild")
spawner = require("./lib/spawner").init()
stdweb  = require("./lib/stdweb")

platforms = process.env.PLATFORMS.split(" ")

app = stdweb("gobuild")

app.get "/", (req, res) ->
  res.send "ok"

app.get "/:os-:arch/:name.:type?", (req, res) ->

  if platforms.indexOf("#{req.params.os}-#{req.params.arch}") is -1
    return res.send("invalid build type", 403)

  res.writeHead 200, "Content-Type":"application/octet-stream"

  env =
    GOARCH: req.params.arch
    GOOS:   req.params.os
    HOST:   process.env.HOST

  ps = spawner.spawn "bin/build #{process.env.PROJECT}", env:env
  ps.on "data", (data) -> res.write data
  ps.on "end",         -> res.end()

app.start (port) -> console.log "listening on #{port}"
