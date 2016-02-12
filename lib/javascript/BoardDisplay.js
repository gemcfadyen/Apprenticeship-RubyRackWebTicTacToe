function BoardDisplay() {
  //  {"formatted_rows":["X",1,2,3,4,5,6,7,8],"valid_moves":["X","O"],"status":null}

  this.paint = function(game_data) {

    var table = document.createElement("table");
    var tableAttribute = document.createAttribute("id");
    tableAttribute.value = "grid-table";

    var grid_representation = game_data.formatted_rows;
    var valid_moves = game_data.valid_moves;
    var game_state = game_data.status;

    console.log("grid to display is: " + grid_representation);
    console.log("valid moves for display is: " + valid_moves);
    console.log("game state to display is: " + game_state);

    for(row=0; row < Math.sqrt(grid_representation.length); i++) {

      var row = table.insertRow(0);

      for (i=0; i < grid_representation.length; i++) {
        var cell = row.insertCell(i);
        if($.inArray(grid_representation[i], valid_moves) != -1) {
          cell.innerHTML = grid_representation[i]
        } else {
          cell.innerHTML = "<a class=\"board-display\" href=\"#\" data-id=cell-" + grid_representation[i] + " data-value=" + i + " data-grid=" + grid_representation + ">" + i + "</a>";
        }
      }

    }

    table.setAttributeNode(tableAttribute);
    return table;
  }
}

module.exports = BoardDisplay;
