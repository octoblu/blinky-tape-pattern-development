chai      = require 'chai'
chaiFS    = require 'chai-fs'
sinon     = require 'sinon'
sinonChai = require 'sinon-chai'
path      = require 'path'
os        = require 'os'
helpers   = require('yeoman-generator').test

chai.use chaiFS
chai.use sinonChai

global.expect = chai.expect
global.sinon  = sinon

global.runGenerator = (options={}, prompt={}, cb=->) ->
  options['skip-install'] = options['skip-install'] ? true

  helpers.run   path.join(__dirname, '../app')
         .inDir path.join(os.tmpdir(), './temp-test')
         .withOptions options
         .withPrompt prompt
         .on 'end', cb

