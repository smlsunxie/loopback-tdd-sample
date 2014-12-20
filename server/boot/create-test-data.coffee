async = require "async"
module.exports = createTestData = (server) ->

  User = server.models.User

  async.waterfall [
    (done) ->
      User.create {
        username: "Spooky"
        fb_userid: "100000233810027"
        token: "CAACEdEose0cBAPWBocPiUZArpDbrZA6FVGob0m6pcBPqnQ2sZCNlg4h1ahmvmcfHJh3lBfa4MJcnN9pH0WkxH3DdXJUSInFlY18eMV47mGz5gNF4OLScOavSoKQz7PNWBwiuw1yXQDrv8agKuZBYXkglYCfLYdSoLZCYlaQudv36Uy3t53DRwx9OxtAlvCHX5LdNngHATL59243ewZCT5kxULQifDPzfIZD"
      }, (error, newUser) ->
        done()

  ], (error, result) ->
    console.log "error", error
    return
