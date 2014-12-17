describe "User", ->

  lt.beforeEach.withApp app

  User = app.models.User

  describe 'create', ->
    it "by model", (done) ->
      User.create {username: "spooky"}, (error, newUser) ->
        newUser.username.should.be.equal "spooky"
        done()

  describe 'find', ->

    it "by model", (done) ->

      User.find {username: "spooky"}, (error, users) ->

        (users.length > 0).should.be.true
        user = users[0]
        user.should.be.have.property "username"
        user.should.be.Object
        done()

    it "by http with supertest", (done) ->
      request(app)
      .get('/api/users')
      .end (err, res) ->
        res.body.should.be.Array
        user = res.body[0]
        user.should.be.Object
        user.should.be.have.property "username"
        done()


    lt.describe.whenCalledRemotely "get", "/api/users", ->

      it "by http with loopback-test", ->
        assert.equal @res.statusCode, 200
        @res.body.should.be.Array

        user = @res.body[0]
        user.should.be.Object
        user.should.be.have.property "username"
