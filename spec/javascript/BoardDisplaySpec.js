var BoardDisplay = BoardDisplay|| require('../../lib/javascript/BoardDisplay');

describe("Creates grid containing the correct number of links for display", function() {

  it("creates table containing one move and eight links", function() {

    var data_for_display =  {
      "formatted_rows": ["X",1,2,3,4,5,6,7,8],
      "valid_moves": ["X","O"],
      "status":null
    };

    var updatedTable = BoardDisplay.paint(data_for_display);

    console.log("Table returned from method under test is: " + updatedTable.innerHTML);

    var cells = updatedTable.getElementsByTagName("td");
    expect(cells.length).toEqual(9);
    expect($(cells).find("a").length).toEqual(8);
    expect(cells[0].innerHTML).toEqual("X");
  });


  it("forms a link correctly in the table", function() {

    var data_for_display =  {
      "formatted_rows": ["X","O","X",3,"X","O","O","X","O"],
      "valid_moves": ["X","O"],
      "status": null
    };

    var updatedTable = BoardDisplay.paint(data_for_display);
    var cells = updatedTable.getElementsByTagName("td");
    var tableLinks = $(cells).find('a');

    expect(tableLinks.length).toEqual(1);
    expect(tableLinks[0].innerHTML).toEqual('4');
    expect(cells[3].innerHTML).toEqual("<a class=\"board-display\" href=\"#\" data-value=\"3\" data-grid=\"X,O,X,3,X,O,O,X,O\">4</a>");
  });
});
