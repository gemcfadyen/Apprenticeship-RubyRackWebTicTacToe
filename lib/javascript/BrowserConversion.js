//new namespace object defined by this file
var mylib = {};
// import used by this file
var dependency = dependency || require('./BoardDisplay');
(function(){

  // define properties on mylib, use dependency

  // export the namespace object
  if (typeof module !== 'undefined' && module.exports) {
    module.exports = mylib;
  }
})();
