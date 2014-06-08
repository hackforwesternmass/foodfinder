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
        <h3><a class='show-agency' data-lat='{{latitude}}' data-long='{{longitude}}' href='#'>{{agency}} - {{type}}</a></h3> \
        <p class='address'>{{address}}, {{city}}, {{state}} {{zip}}</p> \
        <p class='phone'>{{phone}} \
        <p class='distance'>{{distance}} miles away.</p> \
        <p class='hours'>{{hours}}</p> \
        <button class='btn get-directions' data-lat='{{latitude}}' data-long='{{longitude}}'>Get Directions</button> \
        </div><hr />", agency);
    }

    return output;
  };

  /**
   * ajax request
   */
  var req = function(params) {
    $.ajax({
      url: "/ajax",
      type: 'POST',
      data: params
    })
      .done(function( resp ) {
        $("#results").html( render(resp) );
      });
  };

  /**
   * search listener
   */
  $("form#search").on("submit", function(e) {
    var params = $(this).serialize();
    req(params);
    return false;
  });

  $("body").on("click", function(e) {
    if(!$(e.target).hasClass("get-directions")) {
      return;
    } 
    console.log("hey");
    var lat, long, start, end;
    lat = $(e.target).attr('data-lat');
    long = $(e.target).attr('data-long');
    start = $("#start").val();
    end = lat + " " + long;
    console.log(lat, long, start, end);
    calcRoute(start, end);
    e.preventDefault();
    return false;
  });
  
  //$("body").on("click", function(e) {
    //if(!$(e.target).hasClass("show-agency")) {
      //return;
    //}
    //var lat, long;
    //lat = $(e.target).attr('data-lat');
    //long = $(e.target).attr('data-long');
    //zoomTo(lat, long);
    //e.preventDefault();
    //return false;
  //});
});
