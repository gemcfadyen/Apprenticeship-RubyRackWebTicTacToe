describe("A move is made", function() {
  var jsdom = require('jsdom').jsdom;
  var doc = jsdom();
  window = doc.defaultView;
  document = window.document;
  var $ = require('jquery');
  require('jasmine-jquery');

  beforeEach(function() {
    setFixtures('<a class="board-display" href="#" data-id="cell-1" data-value="0"/>');
  });

  it("should receive a successful response", function() {
    //spyOn($, "ajax");

    console.log($('.board-display').data('id'));

    //$('.board-display').click();

    //expect($.ajax.mostRecentCall.args[0]["type"]).toEqual("POST");
  });

  //How to test success, failure
  //how to say it was link '2' that was called, ie test the 'this'

});

