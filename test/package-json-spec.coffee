path    = require 'path'
os      = require 'os'
assert  = require('yeoman-generator').assert
helpers = require('yeoman-generator').test

describe 'package.json', ->
  describe 'pattern: "tree", github: "octoblu"', ->
    beforeEach (done) ->
      runGenerator {}, patternName: 'tree', githubName: 'octoblu', done

    it 'should name the package the "tree"', ->
      assert.fileContent 'package.json', /"name": "tree"/

    it 'should name the package the "tree"', ->
      assert.fileContent 'package.json', /"repository": "octoblu\/tree"/

runGenerator = (options={}, prompt={}, cb=->) ->
  options['skip-install'] = options['skip-install'] ? true

  helpers.run   path.join(__dirname, '../app')
         .inDir path.join(os.tmpdir(), './temp-test')
         .withOptions options
         .withPrompt prompt
         .on 'end', cb

