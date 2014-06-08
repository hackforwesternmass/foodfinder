function initialize()
{
  directionsDisplay = new google.maps.DirectionsRenderer();
  var mapOptions = {
    center: new google.maps.LatLng(42.277309,-72.634735),
    zoom: 10,
    scaleControl: true
  };
  geocoder = new google.maps.Geocoder();
  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  directionsDisplay.setMap(map);
}
function codeAddress(address) {
  address = address.value;
  if (address == 'undefined') return;
  geocoder.geocode(
      { 'address': address }, 
      function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          map.setCenter(results[0].geometry.location);
          var marker = new google.maps.Marker({
            map: map,
              position: results[0].geometry.location
          });
        } else
    alert('Geocode was not successful for the following reason: ' + status);
      }
      );
}
function calcRoute(start, end) {
  //var start = document.getElementById('begin').value;
  //var end = document.getElementById('end').value;
  var request = {
    origin:start,
    destination:end,
    travelMode: google.maps.TravelMode.DRIVING
  };
  directionsService.route(request, function(response, status) {
    if (status == google.maps.DirectionsStatus.OK)
    directionsDisplay.setDirections(response);
  });
}
function zoomTo(lat, long)
{
  var myLatlng = new google.maps.LatLng(lat, long);
  var request = {
    origin:location
  };
  var map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
  // To add the marker to the map, use the 'map' property
  var marker = new google.maps.Marker({
    position: myLatlng,
    map: map,
  });
}
function selectAgency(agency)
{
  if (agency.value == 'undefined')
  {
    document.getElementById('end').value = '';
    return;
  }
  document.getElementById('end').value = agency.value;
  codeAddress(document.getElementById('end'));
}

