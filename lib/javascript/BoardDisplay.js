var BoardDisplay = {};
(function() {

  BoardDisplay.paint = function(game_data) {
    var table = document.createElement("table");
    var tableAttribute = document.createAttribute("id");
    tableAttribute.value = "grid-table";

    var gameStateAsJson = game_data;//TODO jamsine test error = JSON.parse(game_data);
    var grid_representation = gameStateAsJson.formatted_rows;
    var valid_moves = gameStateAsJson.valid_moves;
    var game_state = gameStateAsJson.status;

    console.log("json grid to display is: " + gameStateAsJson.formatted_rows);
    console.log("json valid moves for display is: " + gameStateAsJson.valid_moves);
    console.log("json game state to display is: " + gameStateAsJson.status);
    var offset = 0;
    for(j=0; j< Math.sqrt(grid_representation.length); j++) {

     console.log("row index is: " + j);
      var row = table.insertRow(j);

      for (i = 0; i < 3; i++) {
       console.log("adding cell " + i );

        var cell = row.insertCell(i);
        var cellIndexForDisplay = grid_representation[i + offset];
        if($.inArray(cellIndexForDisplay, valid_moves) != -1) {
          cell.innerHTML = cellIndexForDisplay;
        } else {
          cell.innerHTML = "<a class=\"board-display\" href=\"#\" data-value=" + cellIndexForDisplay + " data-grid=" + grid_representation + ">" + (parseInt(cellIndexForDisplay) + 1) + "</a>";
        }
      }
      offset = offset + 3;

      console.log('new offset is ' + offset );
    }

    table.setAttributeNode(tableAttribute);
    return table;
  };

  if (typeof module !== 'undefined' && module.exports) {
    module.exports = BoardDisplay;
  }

})();
//module.exports = BoardDisplay;
