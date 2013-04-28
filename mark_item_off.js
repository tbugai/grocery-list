#import "/Users/tbugai/Code/Sandbox/grocery-list/integration/github/alexvollmer/tuneup_js/tuneup.js"
test("Mark off item", function(target, app) {
  var cell, cells, table;

  table = app.mainWindow().tableViews()[0];
  cells = table.cells();
  cell = cells.firstWithName("Milk");
  assertNotNull(cell);
  cell.tap();
  cell = cells.firstWithName("Milk-Acquired");
  return assertNotNull(cell);
});
