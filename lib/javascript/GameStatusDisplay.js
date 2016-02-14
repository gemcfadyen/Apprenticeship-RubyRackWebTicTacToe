var GameStatusDisplay = {};
(function() {

  GameStatusDisplay.print = function(message) {
    var paragraph = document.createElement("p");
    var paragraphAttribute = document.createAttribute("id");
    paragraphAttribute.value = "game-status";
    paragraph.innerHTML = message;
    paragraph.setAttributeNode(paragraphAttribute);
   return paragraph;
  };

  if(typeof module !== 'undefined' && module.exports) {
    module.exports = GameStatusDisplay;
  }

})();
