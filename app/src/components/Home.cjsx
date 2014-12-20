
Home = React.createClass(
  getInitialState: ->

    self = this
    # client.models.User.find username: "testuser", (error, friends) ->
    client.models.User.getFriends "1", (error, friends) ->
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
        <td>{friend.name}</td>
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
