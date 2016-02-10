$('.board-display').click(function cellIsClicked(index) {

  var cellClicked =  $(this).attr('data-id');
  var dataValue = $(this).attr('data-value');

  //alert("cell pressed is: " + cellClicked  + " data value is: " + dataValue);

  $.ajax({
    type: "POST",
    url: 'next_move',
    data: 'move-taken='+ dataValue + '&grid=[0, 1, 2, :X, 4, 5, :O, 7, 8]',
    success: success,
    error: failure,
    dataType: 'text'
  });
  return false;
});

function success(data) {
  document.write(data)
}

function failure(data) {
  alert("Ooops!");
}
