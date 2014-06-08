$(function() {
  "use strict";

  /**
   * render agencies to template using mustache
   */
  var render = function(agencies) {
    var output = "";
    var agency;
    for(var i = 0; i < agencies.length; i++) {
      agency = agencies[i];
      agency.distance = agency.distance.toFixed(1)
      output += Mustache.render("<div class='result'> \
        <h3><a class='agency' data-lat='{{latitude}}' data-long='{{longitude}}' href='#'>{{agency}} - {{type}}</a></h3> \
        <p class='address'>{{address}}, {{city}}, {{state}} {{zip}}</p> \
        <p class='distance'>{{distance}} miles away.</p> \
        <p class='hours'>{{hours}}</p> \
        </div><hr />", agency);
    }
    
    return output;
  };

  /**
   * ajax request
   */
  var req = function(params) {
    $.ajax({
      url: "/ajax/?query=" + params,
    })
      .done(function( resp ) {
        $("#results").html( render(resp) );
      });
  };

  /**
   * search listener
   */
  $("#search").keypress(function(e) {
    if(e.keyCode == 13) {
      var params = $("#search").val();
      req(params);
      return false;
    }
  });

  $("body").on("click", function(e) {
    if(!$(e.target).hasClass("agency")) {
        return;
    }
    var lat, long, start, end;
    lat = $(e.target).attr('data-lat');
    long = $(e.target).attr('data-long');
    start = $("#search").val();
    end = lat + " " + long;
    calcRoute(start, end);
    e.preventDefault();
    return false;
  });
});
