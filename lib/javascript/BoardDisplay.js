var BoardDisplay = {};
(function() {

  BoardDisplay.paint = function(gameData) {
    var table = document.createElement("table");
    var tableAttribute = document.createAttribute("id");
    tableAttribute.value = "grid-table";

    var dimension = calculateDimension(gameData);
    var offset = 0;

    for(rowIndex = 0; rowIndex < dimension; rowIndex++) {
      setCells(table.insertRow(rowIndex), dimension, offset, gameData);
      offset = incrementOffset(offset, dimension);
    }

    table.setAttributeNode(tableAttribute);
    return table;
  };

  calculateDimension = function(gameData) {
    return Math.sqrt(gameData.formatted_rows.length)
  };

  setCells = function(row, dimension, offset, gameData) {

    for (cellIndex = 0; cellIndex < dimension; cellIndex++) {
      var cell = row.insertCell(cellIndex);
      cell.innerHTML = formatCell(gameData.formatted_rows[cellIndex + offset], gameData);
    }
  };

  formatCell = function(cellIndex, gameData) {
    if(cellIsOccupied(cellIndex, gameData.valid_moves)) {
      return cellIndex;
    } else if (gameInProgress(gameData.status)) {
      return createLink(cellIndex, gameData.formatted_rows);
    }
    else {
      return oneIndexed(cellIndex);
    }
  };

  oneIndexed = function(cellIndex) {
    return cellIndex + 1;
  };

  cellIsOccupied = function(cellIndex, validMoves) {
    return $.inArray(cellIndex, validMoves) != -1
  };

  gameInProgress = function(gameState) {
    return gameState == null
  };

  createLink = function(cellIndex, grid) {
    return "<a class=\"board-display\" href=\"#\""
      + " data-value=" + cellIndex
      + " data-grid=" + grid + ">" + oneIndexed(cellIndex) + "</a>";
  };

  incrementOffset = function(offset, dimension) {
    return offset + dimension;
  };

  if (typeof module !== 'undefined' && module.exports) {
    module.exports = BoardDisplay;
  }
})();
