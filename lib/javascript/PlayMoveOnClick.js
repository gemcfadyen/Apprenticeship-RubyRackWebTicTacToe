//var BoardDisplay = require('../../lib/javascript/BoardDisplay');
var BoardDisplay = BoardDisplay|| require('../../lib/javascript/BoardDisplay');

var MoveHandler = {

  bindEvents: function() {
    $(".board-display").click(function() {
      var cellIndex = $(this).data("value");
      var grid = $(this).data("grid");

      $.ajax({
        type: "POST",
        url: "next_move",
        data: "move-taken=" + cellIndex + "&grid=" + grid,
        success: MoveHandler.success,
        failure: MoveHandler.error
      });

      return false;
    });
  },

  success : function(data) {
 //   var boardDisplay = new BoardDisplay();
    $("#grid-table").replaceWith(BoardDisplay.paint(data));

    //TODO publish the status of win/draw
  },

  error: function() {
    console.error("Sorry, an exception has occurred. Please restart the game.");
  }
};

window.MoveHandler = MoveHandler;
