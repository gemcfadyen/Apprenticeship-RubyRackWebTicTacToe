function cellIsClicked() {
  $.ajax({
    type: "POST",
    url: 'next_move',
    data: 'move-taken=1&grid=[0, 1, 2, :X, 4, 5, :O, 7, 8]',
    success: success,
    error: failure,
    dataType: 'text'
  });
}

function success(data) {
  document.write(data)
}

function failure(data) {
  alert("Ooops!");
}
