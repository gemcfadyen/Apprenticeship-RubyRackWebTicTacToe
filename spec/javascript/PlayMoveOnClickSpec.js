describe("Player selects a move from the web gui", function() {
  var jsdom = require('jsdom').jsdom;
  var doc = jsdom();
  window = doc.defaultView;
  document = window.document;

  $ = require('jquery');
  require('jasmine-jquery');
  require('../../lib/javascript/PlayMoveOnClick');
  var boardDisplay = require('../../lib/javascript/BoardDisplay');
  var gameStatusDisplay = require('../../lib/javascript/GameStatusDisplay');

  beforeEach(function() {
    setFixtures('<table id="grid-table"><tr><td><a class="board-display" href="#" data-value="0" data-grid=[0,1,2,3,4,5,6,7,8]/></td></tr></table><p id="game-status"></p>');
    window.MoveHandler.bindEvents();
  });

  it("sends a POST when a move is taken", function() {
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

  it("updates the table when a successful move is made", function() {
    spyOn(boardDisplay, "paint").and.returnValue('<table><tr><td>New Content</td></tr></table>');
    spyOn($("#grid-table"), 'replaceWith');

    var gameData = {
      "formatted_rows":["X",1,2,3,4,5,6,7,8],
      "valid_moves":["X","O"],
      "status":null
    };

    window.MoveHandler.success(gameData);

    var elements = document.getElementsByTagName("td");
    expect(elements[0].innerHTML).toEqual("New Content");
    expect(boardDisplay.paint).toHaveBeenCalledWith(gameData);
  });

  it("displays the status when the game is over", function() {
    spyOn(gameStatusDisplay, "print").and.returnValue("<p>X has won</p>");
    var gameData = {
      "formatted_rows":["X","X","X","O","O",5,6,7,8],
      "valid_moves":["X","O"],
      "status": "X has won"
    }

    window.MoveHandler.success(gameData);

    var elements = document.getElementsByTagName("p");
    expect(elements[0].innerHTML).toEqual("X has won");
    expect(gameStatusDisplay.print).toHaveBeenCalledWith(gameData);
  });

  it("raises an error when a failure occurs", function() {
    spyOn(console, "error");

    window.MoveHandler.error();
    var elements = document.getElementsByTagName("td");
    var contentsOfTag = elements[0].innerHTML;

    expect(console.error).toHaveBeenCalledWith("Sorry, an exception has occurred. Please restart the game.");
  });
});
