#github "alexvollmer/tuneup_js/tuneup.js"

test "Add a new item", (target, app) ->
  target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT)
  table = app.mainWindow().tableViews()[0]
  cells = table.cells()

  assertEquals 3, cells.length

  target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_LANDSCAPELEFT)

  app.keyboard().typeString("Cheese\n")

  target.setDeviceOrientation(UIA_DEVICE_ORIENTATION_PORTRAIT)
  assertEquals 4, table.cells().length
  assertNotNull table.cells()["Cheese"]
