describe("A move is made", function() {
  var jsdom = require('jsdom').jsdom;
  var doc = jsdom();
  window = doc.defaultView;
  document = window.document;
  $ = require('jquery');
  require('jasmine-jquery');

  require('../../lib/javascript/BoardOnClick');

  beforeEach(function() {
    setFixtures('<a class="board-display" href="#" data-id="cell-1" data-value="0"/>');
    window.BoardHandler.bindEvents();
  });

  it("should receive a successful response", function() {
    spyOn($, "ajax");

    $('.board-display').click();

    expect($.ajax).toHaveBeenCalledWith({
      success : window.BoardHandler.success
    });
    //expect($.ajax.mostRecentCall.args[0]["type"]).toEqual("POST");
  });

  xit("should call a success", function() {
    spyOn($, "ajax");

    $('.board-display').click();

    expect($.ajax).toHaveBeenCalledWith({});
  });
  //Can directly test success, failure

});

