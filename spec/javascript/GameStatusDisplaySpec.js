describe("Game status is shown to user when game is over", function() {
  var GameStatusDisplay = require('../../lib/javascript/GameStatusDisplay');

  it("shows game status", function() {
    var gameStatus = GameStatusDisplay.print('X has won');

    expect(gameStatus.innerHTML).toEqual('X has won');
  });

  it("shows no game status", function() {
    var gameStatus = GameStatusDisplay.print(null);

    expect(gameStatus.innerHTML).toEqual('');
  });

  it("has attribute set", function() {
    var gameStatus = GameStatusDisplay.print("Draw");
    expect(gameStatus.getAttribute("id")).toEqual("game-status");
  });
});
