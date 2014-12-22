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
    it "One by model", (done) ->
      User.findOne {id: 1}, (error, user) ->
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

  describe 'facebook', ->
    it "user create has token", (done) ->

      User.create {
        username: "testOnlyUser"
        fb_userid: "test"
        token: "test"
      }, (error, user) ->

        user.should.be.have.property "token"
        user.should.be.have.property "fb_userid"
        done()



    it "get friends", (done) ->
      User.find {where: {username: "testOnlyUser"}}, (error, testOnlyUser) ->

        User.getFriends testOnlyUser[0].id, (error, friends) ->
          friends.should.be.Array
          friend = friends[0]

          friend.should.be.have.keys "name", "id"

          done();
