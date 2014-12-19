async = require "async"
module.exports = createTestData = (server) ->

  User = server.models.User

  async.waterfall [
    (done) ->
      User.create {username: "testuser"}, (error, newUser) ->
        done()

  ], (error, result) ->
    console.log "error", error
    return
