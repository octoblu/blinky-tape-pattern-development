describe 'package.json', ->
  describe 'pattern: "tree", github: "octoblu"', ->
    beforeEach (done) ->
      runGenerator {}, patternName: 'tree', githubName: 'octoblu', done

    it 'should create a package.json', ->
      expect('package.json').to.be.a.file().with.json

    it 'should name the package the "tree"', ->
      nameRegexp = /"name": "tree"/
      expect('package.json').to.have.content.that.match nameRegexp

    it 'should name the package the "tree"', ->
      repositoryRegexp = /"repository": "octoblu\/tree"/
      expect('package.json').to.have.content.that.match repositoryRegexp

