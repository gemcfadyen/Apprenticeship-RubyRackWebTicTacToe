var BoardDisplay = BoardDisplay || require('../../lib/javascript/BoardDisplay');
var GameStatusDisplay = GameStatusDisplay || require('../../lib/javascript/GameStatusDisplay');

var MoveHandler = {
  bindEvents: function() {
    REQUEST = {
      type : "POST",
      url: "next_move",
      moveParam: "move-taken",
      gridParam: "grid"
    };

    TAG_IDS = {
      GRID_TABLE: "#grid-table",
      GAME_STATUS: "#game-status"
    };

    $(document).on('click', 'a.board-display', function() {
      var cellIndex = $(this).data("value");
      var grid = $(this).data("grid");

      $.ajax({
        type: REQUEST.type,
        url: REQUEST.url,
        data: REQUEST.moveParam + "=" + cellIndex + "&" + REQUEST.gridParam + "=" + grid,
        success: MoveHandler.success,
        failure: MoveHandler.error
      });

      return false;
    });
  },

  success: function(data) {
    $(TAG_IDS.GRID_TABLE).replaceWith(BoardDisplay.paint(data));
    $(TAG_IDS.GAME_STATUS).replaceWith(GameStatusDisplay.print(data));
  },

  error: function() {
    console.error("Sorry, an exception has occurred. Please restart the game.");
  }
};

window.MoveHandler = MoveHandler;
