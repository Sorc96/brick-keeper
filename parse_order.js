function parseRow(row) {
  const cells = row.querySelectorAll('td')
  const [color, partType] = parsePart(cells[2])
  const quantity = parseQuantity(cells[4])
  const unitprice = parseUnitprice(cells[5])

  return [color, partType, quantity, unitprice]
}

function parsePart(cell) {
  const partString = cell.querySelector('font').innerHTML
  const relevantPart = partString.split('</div>&nbsp;')[1]
  return relevantPart.split('<br>').map(s => s.trim())
}

function parseQuantity(cell) {
  return cell.textContent
}

function parseUnitprice(cell) {
  return cell.textContent.split(/\s/)[1]
}

const rows = [...document.querySelectorAll('tr.avoidBreak')]
const parsedRows = rows.map(parseRow)
const resultJson = JSON.stringify(parsedRows)
console.log(resultJson)
