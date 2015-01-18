describe '.gitignore', ->
  beforeEach (done) ->
    runGenerator {}, {}, done

  it 'should create a file called .gitignore', ->
    expect('.gitignore').to.be.a.file()

