var BoardDisplay = BoardDisplay || require('../../lib/javascript/BoardDisplay');
var GameStatusDisplay = GameStatusDisplay || require('../../lib/javascript/GameStatusDisplay');

var MoveHandler = {

  bindEvents: function() {
    $(document).on('click', 'a.board-display', function() {

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
    //TODO inject BoardDisplay and gamestatus?
    $("#grid-table").replaceWith(BoardDisplay.paint(data));
    $("#game-status").replaceWith(GameStatusDisplay.print(data));
  },

  error: function() {
    console.error("Sorry, an exception has occurred. Please restart the game.");
  }
};

window.MoveHandler = MoveHandler;
