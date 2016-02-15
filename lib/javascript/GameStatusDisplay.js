var GameStatusDisplay = {};
(function() {

  var PARAGRAPH = {
    tag: "p",
    properties: {
      "p": {id: "id", value: "game-status" },
    }
  };


  GameStatusDisplay.print = function(gameData) {
    var paragraph = document.createElement(PARAGRAPH.tag);
    var paragraphAttribute = document.createAttribute(PARAGRAPH.properties[PARAGRAPH.tag].id);
    paragraphAttribute.value = PARAGRAPH.properties[PARAGRAPH.tag].value;
    paragraph.innerHTML = gameData.status;
    paragraph.setAttributeNode(paragraphAttribute);
    return paragraph;
  };

  if(typeof module !== "undefined" && module.exports) {
    module.exports = GameStatusDisplay;
  }

})();
