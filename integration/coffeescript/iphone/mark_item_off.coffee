#github "alexvollmer/tuneup_js/tuneup.js"

test "Mark off item", (target, app) ->
  table = app.mainWindow().tableViews()[0]
  cells = table.cells()

  cell = cells.firstWithName("Milk")
  assertNotNull(cell)
  cell.tap()

  cell = cells.firstWithName("Milk-Acquired")
  assertNotNull(cell)
