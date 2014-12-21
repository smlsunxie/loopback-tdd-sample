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

  describe.only 'facebook', ->
    it "user create has token", (done) ->

      User.create {
        username: "testOnlyUser"
        fb_userid: "100000233810027"
        token: "CAACEdEose0cBANlxsaRI2QSZBNbfh4VpHebCwFHRHnz6H4HAo9Wv3bPCyC9eadPHqrnZBD07ZBV4KPIEKn2MO8w3B0fuTVGj5a1c9xZA0BTiR8b3NxqUWkZCjpSZAgR1iPcOHJKZAdQsqPWfr7WR5GJPnLI7qDRZAsHxIcyZA9xNddUgQks6yM0qUqCRkCE7mUe1opHkC4OWrSxBbMZCuEIjYQ3UflJeRRUEwZD"
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
