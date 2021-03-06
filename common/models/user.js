module.exports = function(User) {


  User.getFriends = function(userid, cb) {
    facebookHelper = require("facebook-helper");

    User.findOne({where: {id: userid}}, function(error, user){

      facebookHelper.getFriends(user.fb_userid, user.token, function(error, friends){

        if(friends === undefined)
          friends = [
            {
              id: -1,
              name: ""
            },
            {
              message: "token can't use",
              user: user
            }
          ]

        console.log("friends", friends);
        return cb(null, friends)
      })

    })


  }


  User.remoteMethod("getFriends", {
    accepts: [
      {arg: "userid", type: "string", required: true},
    ],
    returns: {arg: "result", type: "Array"},
    http: {verb: "post"}
  });


};
