describe 'command.coffee', ->
  beforeEach (done) ->
    runGenerator {}, {}, done

  it 'should create a file called command.coffee', ->
    expect('command.coffee').to.be.a.file()

