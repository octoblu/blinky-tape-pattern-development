_ = require 'lodash'

class Pattern
  constructor: ->
    @ledCount = 60
    @baseFrame = ['red', 'black', 'black']

  generate: =>
    baseFrameSize = _.size @baseFrame

    _.times baseFrameSize, (i) =>
      _.times @ledCount, (j) =>
        @baseFrame[(i + j) % baseFrameSize]

module.exports = Pattern
