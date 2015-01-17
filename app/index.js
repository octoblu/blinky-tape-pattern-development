'use strict';
var yeoman = require('yeoman-generator');
var chalk = require('chalk');
var yosay = require('yosay');

module.exports = yeoman.generators.Base.extend({
  initializing: function () {
    this.pkg = require('../package.json');
  },

  prompting: function () {
    var done = this.async();

    // Have Yeoman greet the user.
    this.log(yosay(
      'Welcome to the ' + chalk.red('Blinky Tape Pattern') + ' generator!'
    ));

    var prompts = [{
      type: 'input',
      name: 'patternName',
      message: 'What is the name of your new Pattern?',
      default : this.appname
    }, {
      type: 'input',
      name: 'githubName',
      message: 'What github user/organization will this be under?'
    }];

    this.prompt(prompts, function (props) {
      this.patternName = props.patternName;
      this.githubName  = props.githubName;

      done();
    }.bind(this));
  },

  writing: {
    app: function () {
      this.template('_package.json', 'package.json');
    }
  },

  install: function () {
    this.installDependencies({
      skipInstall: this.options['skip-install']
    });
  }
});
