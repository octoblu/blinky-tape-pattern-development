_ = require 'lodash'

class Pattern
  constructor: ->
    @ledCount = 60
    @baseFrame = ['red', 'black', 'black']

  generate: =>
    baseFrameSize = _.size @baseFrame

    _.times @ledCount, (i) =>
      _.times @baseFrame, (j) =>
        @baseFrame[(i + j) % baseFrameSize]

module.exports = Pattern
