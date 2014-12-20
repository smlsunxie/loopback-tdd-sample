module.exports = function(User) {

  User.getFriends = function(userid, cb) {
    facebookHelper = require("facebook-helper");



    return cb(null, [])
  }



  User.remoteMethod("getFriends", {
      accepts: [
    {arg: "userid", type: "string", required: true},
    ],
    returns: {arg: "result", type: "Array"},
    http: {verb: "post"}
  });

};
