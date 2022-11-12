document.addEventListener('turbolinks:load', function() {
  let control = document.querySelector('.sort-by-title')

  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  let table = document.querySelector('table')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/NodeList
  let rows = table.querySelectorAll('tr')
  let sortedRows = []

  //count the amount of table cells with text
  let text_field_counter = 0
  for (let i = 1; i < rows.length; i++) {
    if (rows[i].querySelector('td').classList.contains('text-field')) {
      text_field_counter++
    } else {
      text_field_counter = text_field_counter
    }
  }

  for (let i = 1; i < text_field_counter + 1; i++) {
    sortedRows.push(rows[i])
  }

  if (this.querySelector('.octicon-arrow-up').classList.contains('hide')) {
    sortedRows.sort(compareRowsAsc)
    this.querySelector('.octicon-arrow-up').classList.remove('hide')
    this.querySelector('.octicon-arrow-down').classList.add('hide')
  } else {
    sortedRows.sort(compareRowsDesc)
    this.querySelector('.octicon-arrow-down').classList.remove('hide')
    this.querySelector('.octicon-arrow-up').classList.add('hide')
  }

  let sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])

  for (let i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }

  //Check if there are some more cells after text cells and add them
  if (text_field_counter + 1 < rows.length) {
    for (let i = 1; i < (rows.length - text_field_counter); i++) {
      sortedTable.appendChild(rows[rows.length - i])
    }
  }

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return -1}
  if (testTitle1 > testTitle2) {return 1}
  return 0
}

function compareRowsDesc(row1, row2) {
  let testTitle1 = row1.querySelector('td').textContent
  let testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return 1}
  if (testTitle1 > testTitle2) {return -1}
  return 0
}
