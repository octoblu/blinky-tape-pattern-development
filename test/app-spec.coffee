path     = require 'path'
os       = require 'os'
{assert} = require 'yeoman-generator'
helpers  = require('yeoman-generator').test

describe 'app', ->
  beforeEach (done) ->
    helpers.run   path.join(__dirname, '../app')
           .inDir path.join(os.tmpdir(), './temp-test')
           .withOptions 'skip-install': true
           .withPrompt someOption: true
           .on 'end', done

  it 'creates files', ->
    assert.file [
      'package.json'
    ]
