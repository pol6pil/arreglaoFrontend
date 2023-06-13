'use strict'
async function submitAppliance (formData) {
  await fetch('http://localhost:80/appliances', {
    method: 'POST',
    body: formData
  })
}
async function updateAppliance (formData, id) {
  await fetch(`http://localhost:80/appliances/${id}`, {
    method: 'PUT',
    body: formData
  })
}

async function deleteAppliance (id) {
  const res = await fetch(`http://localhost:80/appliances/${id}`, {
    method: 'DELETE'
  })
  const json = await res.json()
  return json
}

async function showAppliance (id, form, divImg) {
  const res = await fetch(`http://localhost:80/appliances/${id}`)
  const json = await res.json()
  form.nombre.value = json.name
  const img = document.createElement('img')
  img.setAttribute('src', json.imgUrl)
  img.alt = json.name
  divImg.append(img)

  const controls = document.querySelector('#controls')
  const button = document.createElement('button')
  controls.append(button)
  button.className = 'eraseButton'
  button.type = 'button'
  button.append('Borrar Electrodomestico')

  button.onclick = async () => {
    if(window.confirm('Esta seguro de que quiere eliminar el electrodomestico de manera permanenente?')){
      const response = await deleteAppliance(id)
      if(response.status === 'ok'){
        window.location.href = './index.html'
      }
    }
  }
}

// Recibimos el id del URL
const urlParams = new URLSearchParams(window.location.search)
const id = urlParams.get('id') || 0
// Formulario para insertar un electrodomestico
const form = document.forms.appliance

// Mostramos los datos del electrodomestico
if (id > 0) {
  const container = document.querySelector('main form div:nth-child(2)')
  const divImg = document.createElement('div')
  container.append(divImg)
  showAppliance(id, form, divImg)
}

form.onsubmit = async (e) => {
  e.preventDefault()
  const file = form.imagen
  const formData = new FormData()

  formData.append('name', form.nombre.value)

  formData.append('files', file.files[0])

  if (id > 0) {
    await updateAppliance(formData, id)
    window.alert('Electrodomestico editado exitosamente')
  } else {
    await submitAppliance(formData)
    window.alert('Electrodomestico inserado exitosamente')
  }
  window.location.href = './index.html'
}
