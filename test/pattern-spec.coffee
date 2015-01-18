describe 'pattern.coffee', ->
  beforeEach (done) ->
    runGenerator {}, {}, done

  it 'should create a file called pattern.coffee', ->
    expect('pattern.coffee').to.be.a.file()

