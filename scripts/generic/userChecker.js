'use strict'
// eslint-disable-next-line no-unused-vars
function isAdmin () {
  if (window.localStorage.getItem('user') !== null) {
    const user = JSON.parse(window.localStorage.getItem('user'))
    if (user.isAdmin === 1) {
      return true
    }
  }
  return false
}
// eslint-disable-next-line no-unused-vars
function isLogged () {
  if (window.localStorage.getItem('user') !== null) {
    const user = JSON.parse(window.localStorage.getItem('user'))
    if (user.isAdmin === 0) {
      return true
    }
  }
  return false
}
