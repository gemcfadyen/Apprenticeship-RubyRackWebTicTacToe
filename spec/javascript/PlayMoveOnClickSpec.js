describe("Player selects a move from the web gui", function() {
  var jsdom = require('jsdom').jsdom;
  var doc = jsdom();
  window = doc.defaultView;
  document = window.document;

  $ = require('jquery');
  require('jasmine-jquery');
  require('../../lib/javascript/PlayMoveOnClick');

  beforeEach(function() {
    setFixtures('<a class="board-display" href="#" data-id=cell-1 data-value="0"/>');
    window.MoveHandler.bindEvents();
  });


  it("on click, a post request should be sent with the selected move", function() {
    spyOn($, "ajax");

    $(".board-display").click();

    expect($.ajax).toHaveBeenCalledWith({
      type: "POST"
    });
  });
});
