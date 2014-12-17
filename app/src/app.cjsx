
React = window.React = require("react")
Router = require('react-router')
Route = Router.Route
Routes = Router.Routes
NotFoundRoute = Router.NotFoundRoute
DefaultRoute = Router.DefaultRoute

Home = require("./components/Home")

window.modules = {}

mountNode = document.getElementById("app")

React.renderComponent <Home />, mountNode


module.exports = app
