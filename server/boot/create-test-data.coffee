async = require "async"
module.exports = createTestData = (server) ->

  User = server.models.User

  async.waterfall [
    (done) ->
      User.create {
        username: "Spooky"
        fb_userid: "test"
        token: "test"
      }, (error, newUser) ->
        done()

  ], (error, result) ->
    console.log "error", error
    return
