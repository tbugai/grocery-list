#github "alexvollmer/tuneup_js/tuneup.js"

test "delete an item", (target, app) ->
  target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT)
  
  table = app.mainWindow().tableViews()[0]
  cell = table.cells().firstWithName('Eggs')
  assertNotNull cell

  cell.dragInsideWithOptions({startOffset:{x:0.0, y:0.1}, endOffset:{x:0.5, y:0.1}, duration:0.25})

  deleteButton = table.cells().firstWithName('Eggs').buttons()[0]
  assertNotNull deleteButton

  deleteButton.tap()

  assertEquals 2, table.cells().length
  assertNull table.cells().firstWithName("Eggs")

