#github "alexvollmer/tuneup_js/tuneup.js"

test "Add a new item", (target, app) ->
  table = app.mainWindow().tableViews()[0]
  cells = table.cells()

