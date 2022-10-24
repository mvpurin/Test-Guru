document.addEventListener('turbolinks:load', function() {
  var control = document.querySelector('.sort-by-title')

  if (control) {control.addEventListener('click', sortRowsByTitle)}
})

function sortRowsByTitle() {
  var table = document.querySelector('table')

  // NodeList
  // https://developer.mozilla.org/ru/docs/Web/API/NodeList
  var rows = table.querySelectorAll('tr')
  var sortedRows = []

  // selected all table rows except first one which is the header,
  //and two lasts, which are 'New test' and 'Gists list' buttoms
  for (var i = 2; i < rows.length - 2; i++) {
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

  var sortedTable = document.createElement('table')

  sortedTable.classList.add('table')
  sortedTable.appendChild(rows[0])
  sortedTable.appendChild(rows[1])

  for (var i = 0; i < sortedRows.length; i++) {
    sortedTable.appendChild(sortedRows[i])
  }
  sortedTable.appendChild(rows[rows.length - 2])
  sortedTable.appendChild(rows[rows.length - 1])

  table.parentNode.replaceChild(sortedTable, table)
}

function compareRowsAsc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return -1}
  if (testTitle1 > testTitle2) {return 1}
  return 0
}

function compareRowsDesc(row1, row2) {
  var testTitle1 = row1.querySelector('td').textContent
  var testTitle2 = row2.querySelector('td').textContent

  if (testTitle1 < testTitle2) {return 1}
  if (testTitle1 > testTitle2) {return -1}
  return 0
}
