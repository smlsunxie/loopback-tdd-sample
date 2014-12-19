
Home = React.createClass(
  getInitialState: ->

    self = this
    client.models.User.find username: "testuser", (error, friends) ->
      self.setState friends: friends

    return {
      friends: [{
        id: "123",
        name: "abc"
      }]
    }


  render: ->

    displayFriends = (friend) ->
      <tr>
        <td>{friend.id}</td>
        <td>{friend.username}</td>
      </tr>


    <table>
      <tr>
        <td>name</td>
        <td>id</td>
      </tr>
      {@state.friends.map(displayFriends)}
    </table>
)

module.exports = Home
