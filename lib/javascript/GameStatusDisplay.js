var GameStatusDisplay = {};
(function() {

  GameStatusDisplay.print = function(gameData) {
    console.log("UPDATE STATUS WITH " + gameData.status);

    var gameStatus = gameData.status;
   console.log("GAME STATUS = " + gameStatus);

    var paragraph = document.createElement("p");
    var paragraphAttribute = document.createAttribute("id");
    paragraphAttribute.value = "game-status";
    paragraph.innerHTML = gameStatus;
    paragraph.setAttributeNode(paragraphAttribute);
    return paragraph;
  };

  if(typeof module !== 'undefined' && module.exports) {
    module.exports = GameStatusDisplay;
  }

})();
