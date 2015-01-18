Pattern = require './pattern'
meshblu = require 'meshblu'
debug   = require('debug')('pattern')

class Command
  loadConfig: =>
    try
      return require './meshblu.json'
    catch
      console.error 'meshblu.json missing. Copy over the one from your meshblu-blinky-tape project :-)'
      process.exit 1

  run: =>
    @config = @loadConfig()
    @animation = (new Pattern()).generate()
    debug 'animation', JSON.stringify(@animation)

    @conn = meshblu.createConnection _.pick(config, ['uuid', 'token', 'server', 'port'])
    @conn.on 'ready', =>
      debug 'ready'
      @conn.message {
        devices: [@config.uuid]
        animation: @animation
      }, =>
        debug 'sent'
        process.exit 0




new Command().run()
