describe("Game status is shown to user when game is over", function() {
  var GameStatusDisplay = require('../../lib/javascript/GameStatusDisplay');

  it("shows game status", function() {
    var gameData = {
      "formatted_rows": ["X",1,2,3,4,5,6,7,8],
      "valid_moves": ["X","O"],
      "status": "X has won"
    };

    var gameStatus = GameStatusDisplay.print(gameData);

    expect(gameStatus.innerHTML).toEqual('X has won');
  });

  it("shows no game status", function() {
    var gameData = {
      "formatted_rows": ["X",1,2,3,4,5,6,7,8],
      "valid_moves": ["X","O"],
      "status": null
    };

    var gameStatus = GameStatusDisplay.print(gameData);
    expect(gameStatus.innerHTML).toEqual('');
  });

  it("has id attribute set", function() {
    var gameData = {
      "formatted_rows": ["X",1,2,3,4,5,6,7,8],
      "valid_moves": ["X","O"],
      "status": "Draw"
    };

    var gameStatus = GameStatusDisplay.print(gameData);
    expect(gameStatus.getAttribute("id")).toEqual("game-status");
  });
});
