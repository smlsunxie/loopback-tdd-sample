
React = window.React = require("react")
Router = require('react-router')

Home = require("./components/Home")

window.modules = {}

mountNode = document.getElementById("app")

React.renderComponent <Home />, mountNode


module.exports = app
