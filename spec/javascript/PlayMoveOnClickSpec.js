describe("Player selects a move from the web gui", function() {
  var jsdom = require('jsdom').jsdom;
  var doc = jsdom();
  window = doc.defaultView;
  document = window.document;

  $ = require('jquery');
  require('jasmine-jquery');
  require('../../lib/javascript/PlayMoveOnClick');

  beforeEach(function() {
    setFixtures('<table id="grid-table"><tr><td><a class="board-display" href="#" data-id=cell-1 data-value="0" data-grid=[0,1,2,3,4,5,6,7,8]/></td></tr></table>');
    window.MoveHandler.bindEvents();
  });


  it("on click, a post request should be sent with the selected move", function() {
    spyOn($, "ajax");

   $(".board-display").click();

    expect($.ajax).toHaveBeenCalledWith({
      type: "POST",
      url: "next_move",
      data: "move-taken=0&grid=0,1,2,3,4,5,6,7,8",
      success: window.MoveHandler.success,
      failure: window.MoveHandler.error
    });
  });

  it("on success, the table element is updated", function() {
    window.MoveHandler.success("<table id=\"grid-table\"><tr><td>New-Content</td></tr></table>");
    var elements = document.getElementsByTagName("td");
    var contentsOfTag = elements[0].innerHTML;

    expect(elements.length).toEqual(1);
    expect(contentsOfTag).toEqual("New-Content");
  });

  it("on failure, raises an error", function() {
    spyOn(console, "error");

    window.MoveHandler.error();
    var elements = document.getElementsByTagName("td");
    var contentsOfTag = elements[0].innerHTML;

    expect(console.error).toHaveBeenCalledWith("Sorry, an exception has occurred. Please restart the game.");
  });

  //TODO test that the failure raises an alert
});
