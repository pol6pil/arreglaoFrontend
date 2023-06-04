'use strict'
async function register (formData) {
  const res = await fetch('http://localhost/users/', {
    method: 'POST',
    body: formData // Payload is formData object
  })
  if (res.ok) {
    window.alert('Usuario registrado exitosamente')
    const json = await res.json()
    // eslint-disable-next-line no-undef
    saveUser(json)
  }
}

function validatePassword () {
  const password = document.forms.register.password.value
  if (password.length < 6) {
    const span = document.querySelector('#validatingPasswordError')
    span.className = 'error'
    return false
  } else {
    const span = document.querySelector('#validatingPasswordError')
    span.className = 'hidden'
  }
  const password2 = document.forms.register.password2.value
  // eslint-disable-next-line eqeqeq
  if (password != password2) {
    const span = document.querySelector('#matchingPasswordsError')
    span.className = 'error'
    return false
  } else {
    const span = document.querySelector('#matchingPasswordsError')
    span.className = 'hidden'
  }
  return true
}
const form = document.forms.register

form.password.onchange = (e) => {
  if (validatePassword()) {
    form.submit.disabled = false
  } else {
    form.submit.disabled = true
  }
}
form.password2.onchange = (e) => {
  if (validatePassword()) {
    form.submit.disabled = false
  } else {
    form.submit.disabled = true
  }
}

form.onsubmit = (e) => {
  e.preventDefault()

  const formData = new FormData(form)
  register(formData)
}
