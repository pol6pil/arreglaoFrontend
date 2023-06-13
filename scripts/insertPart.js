'use strict'
/* eslint-disable no-eval */
async function getPfp(email) {
  const res = await fetch(`http://localhost/users/${email}`)
  const json = await res.json()
  return json.imgUrl
}

async function deleteReview(id) {
  const res = await fetch(`http://localhost:80/reviews/${id}`, {
    method: 'DELETE'
  })
  return await res.json()
}

async function showReviews(id) {
  const section = document.querySelector('#reviews')
  const sectionHeader = document.createElement('h2')
  sectionHeader.append('Reseñas')
  section.append(sectionHeader)
  const reviews = await getReviews(id)
  if (reviews.length > 0) {
    for (const review of reviews) {
      showReview(review, section)
    }
  } else {
    const span = document.createElement('span')
    span.textContent = 'Todavía no se ha escrito ninguna reseña!'
    section.append(span)
  }
}

async function showReview(review, div) {
  const article = document.createElement('article')
  const userDiv = document.createElement('div')
  article.append(userDiv)
  // Mostramos la foto de perfil
  const pfp = document.createElement('img')
  userDiv.append(pfp)
  pfp.className = 'pfpImage'
  const imgUrl = await getPfp(review.email)
  pfp.setAttribute('src', imgUrl)
  // Mostramos el correo
  const emailSpan = document.createElement('span')
  userDiv.append(emailSpan)
  emailSpan.append(review.email)

  // Mostramos la puntuacion
  const guideTitleDiv = document.createElement('div')
  article.append(guideTitleDiv)
  const score = document.createElement('ul')
  guideTitleDiv.append(score)
  score.className = 'rating'
  for (let i = 0; i < 5; i++) {
    const scoreStar = document.createElement('li')
    score.append(scoreStar)
    scoreStar.className = 'rating-item'
    scoreStar.setAttribute('data-rate', i + 1)
    if (i + 1 === review.rating) {
      scoreStar.classList.add('active')
    }
  }
  // Mostramos el titulo
  const title = document.createElement('h3')
  guideTitleDiv.append(title)
  title.textContent = review.title

  // Mostramos el contenido de la review
  const contentDiv = document.createElement('div')
  const p = document.createElement('p')
  p.textContent = review.content
  contentDiv.append(p)
  article.append(contentDiv)

  // Creacion del boton para eliminar la reseña
  const eraseButton = document.createElement('button')
  eraseButton.type = 'button'
  eraseButton.append('X')
  eraseButton.className = 'eraseButton'
  article.append(eraseButton)

  // Evento para borrar la reseña
  eraseButton.onclick = async (e) => {
    if (window.confirm('Esta seguro de que quiere eliminar la reseña de manera permanenente?')) {
      const response = await deleteReview(review.id)
      if (response.status === 'ok') {
        window.location.reload()
      }
    }
  }

  div.append(article)
}

async function getReviews(id) {
  const res = await fetch(`http://localhost/reviews/${id}`)
  return await res.json()
}

async function showCategories(div) {
  // Creamos el select
  const select = document.createElement('select')
  select.name = 'categoria'

  // Recibimos las categorias
  const res = await fetch('http://localhost/categories')
  const json = await res.json()

  for (const category of json) {
    const option = document.createElement('option')
    option.value = category.id
    option.append(category.name)
    select.append(option)
  }
  div.append(select)
}

async function showAppliances(div) {
  // Creamos el select
  const select = document.createElement('select')
  select.name = 'electronico'

  // Recibimos las categorias
  const res = await fetch('http://localhost/appliances')
  const json = await res.json()

  for (const category of json) {
    const option = document.createElement('option')
    option.value = category.id
    option.append(category.name)
    select.append(option)
  }
  div.append(select)
}

async function insertPart(formData) {
  const res = await fetch('http://localhost/parts', {
    method: 'POST',
    body: formData // Payload is formData object
  })
  const json = await res.json()
  if (json.id !== undefined) {
    window.alert('Pieza insertada exitosamente')
    window.location.href = './index.html'
  }
}
async function updatePart(id, formData) {
  const res = await fetch(`http://localhost/parts/${id}`, {
    method: 'PUT',
    body: formData // Payload is formData object
  })
  const json = await res.json()
  if (json.id !== undefined) {
    window.alert('Pieza actualizada exitosamente')
    window.location.href = './index.html'
  }
}
async function deletePart(id) {
  const res = await fetch(`http://localhost/parts/${id}`, {
    method: 'DELETE'
  })
  const json = await res.json()
  if (json.message === 'delete successful') {
    window.alert('Pieza borrada exitosamente')
    // window.location.href = './index.html'
  }
}

// Funcion que muestra la parte
async function showPart(id, form) {
  // Recibimos la parte de la api
  const res = await fetch(`http://localhost/parts/${id}`)
  const json = await res.json()
  showReviews(id)
  // Rellenamos los campos con la parte
  form.nombre.value = json.name
  form.descripcion.value = json.description
  form.garantia.value = json.warranty
  form.advertencia.value = json.warning
  form.nota.value = json.note
  form.garantia.value = json.warranty

  // Recorremos las opciones de los select para mostrar la opcion correcta
  const optionsAppliance = form.electronico.querySelectorAll('option')
  for (const optionAppliance of optionsAppliance) {
    optionAppliance.selected = optionAppliance.value === json.appliance.toString()
  }
  const optionsCategory = form.categoria.querySelectorAll('option')
  for (const optionCategory of optionsCategory) {
    optionCategory.selected = optionCategory.value === json.category.toString()
  }

  // Mostramos las opciones de la parte
  for (const option of json.options) {
    addOptionForm(optionsQuantity, true, option.id)
    eval('form.nombreOpt' + optionsQuantity + '.value = option.name')
    eval('form.precioOpt' + optionsQuantity + '.value = option.price')

    // Mostramos la imagen
    const optionImg = document.createElement('img')
    optionImg.setAttribute('src', option.imgUrl)

    const imageDiv = document.querySelector(`#option${optionsQuantity}Image`)
    imageDiv.append(optionImg)
    optionsQuantity++
  }
}
// Evento del boton para generar un formulario de opcion
function addOptionForm(i, isUpdate, id) {
  console.log(i)
  // Generamos el div de la opcion
  const optionsDiv = document.querySelector('#options')
  const optionDiv = document.createElement('div')
  optionDiv.className = 'option'

  // Si la opcion existe mostramos la imagen generamos un div en el que poner la imagen
  if (isUpdate) {
    const imageDiv = document.createElement('div')
    imageDiv.id = `option${i}Image`
    optionDiv.append(imageDiv)
  }

  // Contenemos el formulario del option en un div
  const optionForm = document.createElement('div')

  // Generamos los campos de la opcion
  // Nombre
  const nombreDiv = document.createElement('div')

  const nombreLabel = document.createElement('label')
  nombreLabel.for = `nombreOpt${i}`
  nombreLabel.append('Nombre:')
  nombreDiv.append(nombreLabel)

  const nombreInput = document.createElement('input')
  nombreInput.name = `nombreOpt${i}`
  nombreInput.type = 'text'
  nombreInput.required = true
  nombreDiv.append(nombreInput)

  optionForm.append(nombreDiv)

  // Imagen
  const imagenDiv = document.createElement('div')

  const imagenLabel = document.createElement('label')
  imagenLabel.for = `imagenOpt${i}`
  imagenLabel.append('Imagen:')
  imagenDiv.append(imagenLabel)

  const imagenInput = document.createElement('input')
  imagenInput.name = `imagenOpt${i}`
  imagenInput.type = 'file'
  imagenInput.accept = 'image/*'
  imagenDiv.append(imagenInput)

  // Si la imagen no se actualiza es obligatoria
  if (!isUpdate) {
    imagenInput.required = true
  }

  optionForm.append(imagenDiv)

  // Precio
  const precioDiv = document.createElement('div')

  const precioLabel = document.createElement('label')
  precioLabel.for = `precioOpt${i}`
  precioLabel.append('Precio:')
  precioDiv.append(precioLabel)

  const precioInput = document.createElement('input')
  precioInput.name = `precioOpt${i}`
  precioInput.type = 'number'
  precioInput.step = '.01'
  precioInput.required = true
  precioDiv.append(precioInput)

  optionForm.append(precioDiv)
  optionDiv.append(optionForm)

  // Creacion del boton para eliminar la opcion
  const eraseButton = document.createElement('button')
  eraseButton.type = 'button'
  eraseButton.append('X')
  eraseButton.className = 'eraseButton'
  optionDiv.append(eraseButton)

  if (isUpdate) {
    optionDiv.className += ' optionUpdate'
  }
  // Si la opcion ya es existente le asignamos un id
  if (id) {
    optionDiv.id = id
  }

  // Evento para borrar la opcion
  eraseButton.onclick = (e) => {
    // Si el contenedor es de clase optionUpdate no lo borraremos de la interfaz si no que se ocultara para luego
    // Poder acceder a sus datos para realizar la consulta de delete
    let div = e.target.closest('.optionUpdate')
    if (div !== null) {
      div.style.display = 'none'
    }
    // Si el contenedor es de clase option lo eliminaremos de la interfaz
    div = e.target.closest('.option:not(.optionUpdate)')
    if (div !== null) {
      div.remove()
    }
  }

  optionsDiv.append(optionDiv)
}
// Obtenemos el id de la pieza
const urlParams = new URLSearchParams(window.location.search)
const id = urlParams.get('id') || 0

// Si el usuario no es una admin, le redirigimos a otra pagina
// eslint-disable-next-line no-undef
if (!isAdmin()) {
  window.location.href = './error.html'
}

const form = document.forms.pieza
const categories = form.querySelector('#categories')
const appliances = form.querySelector('#appliances')
showCategories(categories)
showAppliances(appliances)
const addOptionButton = document.querySelector('#addOptionButton')
let optionsQuantity = 0

// Si tiene una id, se muestran los datos de la parte
if (id > 0) {
  // Agregamos un buffer para que no de excepcion
  setTimeout(() => showPart(id, form), 100)
  // Mostramos el boton para borrar la pieza
  const delButton = document.createElement('button')
  delButton.className = 'eraseButton'
  delButton.type = 'button'
  delButton.innerText = 'Borrar pieza'
  delButton.onclick = () => {
    if (window.confirm('¿Está seguro de que quiere borrar la pieza de manera permanente?') === true) {
      deletePart(id)
      window.location.href = './index.html'
    }
  }
  const delDiv = document.querySelector('form div:last-child')
  delDiv.append(delButton)
}

// Creacion de los select de categorias
addOptionButton.onclick = function (e) {
  addOptionForm(optionsQuantity)
  optionsQuantity++
}

// Evento submit del formulario
form.onsubmit = (e) => {
  e.preventDefault()
  // Prevents HTML handling submission
  const options = document.querySelectorAll('.optionUpdate, .option')
  console.log(options)
  // Creamos un formData al que pasarle todos los datos del formulario
  const formData = new FormData()

  formData.append('name', form.nombre.value)
  formData.append('description', form.descripcion.value)
  formData.append('warranty', form.garantia.value)
  formData.append('warning', form.advertencia.value)
  formData.append('note', form.nota.value)
  formData.append('category', form.categoria.value)
  formData.append('appliance', form.electronico.value)
  const optionsArr = []
  let i = 0
  let optionsCount = 0
  for (const option of options) {
    const file = eval('form.imagenOpt' + i)
    // Si la opcion se tiene que actualizar porque ya existia lo marcamos
    let update = option.classList.contains('optionUpdate')
    // Si la opcion ha sido borrada de la interfaz
    const isDelete = option.style.display === 'none'

    if (isDelete) {
      update = false
    } else {
      optionsCount++
    }
    // Si la opcion tiene que actualizar la imagen
    const imageUpload = file.files[0] !== undefined
    if (imageUpload && !isDelete) {
      formData.append('files', file.files[0])
    }
    // Appends value of text input
    optionsArr.push({
      id: option.id,
      name: eval('form.nombreOpt' + i + '.value'),
      price: eval('form.precioOpt' + i + '.value'),
      update,
      imageUpload,
      isDelete
    })

    i++
  }
  const optionsJson = JSON.stringify(optionsArr)
  console.log(optionsJson)
  formData.append('options', optionsJson)
  if (optionsCount > 0) {
    if (id > 0) {
      updatePart(id, formData)
    } else {
      insertPart(formData)
    }
  } else {
    window.alert('La pieza necesita como mínimo 1 opción')
  }
}
