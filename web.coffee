async   = require("async")
coffee  = require("coffee-script")
dd      = require("./lib/dd")
express = require("express")
log     = require("./lib/logger").init("gobuild")
spawner = require("./lib/spawner").init()
stdweb  = require("./lib/stdweb")

binary    = process.env.PROJECT.split("/").pop()
platforms = process.env.PLATFORMS.split(" ")
project   = process.env.PROJECT

app = stdweb("gobuild")

app.get "/", (req, res) ->
  res.locals.binary_name = (platform) -> if platform.split("-")[0] is "windows" then "#{binary}.exe" else binary
  res.render "index.jade", platforms:platforms

app.get "/:os-:arch/:name.:type?", (req, res) ->

  if platforms.indexOf("#{req.params.os}-#{req.params.arch}") is -1
    return res.send("invalid build type", 403)

  res.writeHead 200, "Content-Type":"application/octet-stream"

  env =
    GOARCH: req.params.arch
    GOOS:   req.params.os
    HOST:   process.env.HOST

  ps = spawner.spawn "bin/build #{project}", env:env
  ps.on "data", (data) -> res.write data
  ps.on "end",         -> res.end()

app.start (port) -> console.log "listening on #{port}"
