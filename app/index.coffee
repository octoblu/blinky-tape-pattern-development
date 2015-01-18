yeoman = require 'yeoman-generator'
chalk  = require 'chalk'
yosay  = require 'yosay'
_      = require 'lodash'
_.str  = require 'underscore.string'

module.exports = yeoman.generators.Base.extend
  initializing: ->
    @pkg = require '../package.json'

  prompting: ->
    done = @async()

    @log yosay "Welcome to the #{chalk.red('Blinky Tape Pattern')} generator!"

    prompts = [{
      type: 'input'
      name: 'patternName'
      message: 'What is the name of your new Pattern?'
      default : _.str.slugify(@appname)
    }, {
      type: 'input',
      name: 'githubName',
      message: 'What github user/organization will this be under?'
    }]

    @prompt prompts, (props) =>
      this.patternName = props.patternName
      this.githubName  = props.githubName

      done()

  writing:
    app: ->
      @template '_package.json', 'package.json'
      @template '_gitignore', '.gitignore'
      @template '_command.coffee', 'command.coffee'
      @template '_pattern.coffee', 'pattern.coffee'

  install: ->
    @installDependencies
      skipInstall: this.options['skip-install']

