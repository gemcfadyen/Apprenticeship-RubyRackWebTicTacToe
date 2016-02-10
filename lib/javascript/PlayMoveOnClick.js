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

    });
  },

  success : function(data) {
  },

  error: function() {
  }
};

window.MoveHandler = MoveHandler;
