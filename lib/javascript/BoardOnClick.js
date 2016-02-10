var BoardHandler = {
  bindEvents: function() {
    $('.board-display').click(function() {
      var cellClicked =  $(this).attr('data-id');
      var dataValue = $(this).attr('data-value');

      //alert("cell pressed is: " + cellClicked  + " data value is: " + dataValue);

      $.ajax({
        type: "POST",
        url: 'next_move',
        data: 'move-taken='+ dataValue + '&grid=[0, 1, 2, :X, 4, 5, :O, 7, 8]',
        success: BoardHandler.success,
        error: BoardHandler.failure,
        dataType: 'text'
      });
      return false;
    });
  },
  success : function(data) {
    document.write(data)
  },
  failure : function(data) {
    alert("Ooops!");
  }
};

window.BoardHandler = BoardHandler;
