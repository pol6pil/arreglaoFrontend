'use strict'

async function getAllAppliances () {
  const res = await fetch('http://localhost:80/appliances')
  const json = await res.json()
  const divAppliances = document.querySelector('#appliances')

  for (const appliance of json) {
    showAppliance(appliance, divAppliances)
  }
}
function showAppliance (appliance, div) {
  const article = document.createElement('article')
  const a = document.createElement('a')
  // eslint-disable-next-line no-undef
  a.setAttribute('href', `./parts.html?appliance=${appliance.id}`)
  const img = document.createElement('img')
  img.setAttribute('src', appliance.imgUrl)
  a.append(img)
  const span = document.createElement('span')
  span.append(appliance.name)
  a.append(span)
  article.append(a)
  div.append(article)
}
getAllAppliances()
