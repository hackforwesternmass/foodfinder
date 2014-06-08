$(function() {
  "use strict";

  var req = function(params) {
    $.ajax({
      url: "/ajax/?query=" + params,
    })
      .done(function( resp ) {
        console.log( resp );
      });
  };

 
  $("#search").keypress(function(e) {
    if(e.keyCode == 13) {
      var params = $("#search").val();
      req(params);
      return false;
    }
  });
});
