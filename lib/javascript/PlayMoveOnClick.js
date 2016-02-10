console.log("hi");

var MoveHandler = {

  bindEvents: function() {
    $(".board-display").click(function() {

      $.ajax({
        type: "POST"
        //     url: "next_move",
        //    data: 'move-taken='+ cell_index + '' +

      });
    });
  }
};

window.MoveHandler = MoveHandler;
