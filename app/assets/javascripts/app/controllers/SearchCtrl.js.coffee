@app.controller('SearchCtrl', ($scope, Agency) ->

  $scope.agencies = Agency.query()

  $scope.map =
    center:
      latitude: 42.277309
      longitude: -72.634735
    zoom: 10

  $scope.performSearch = ->
    $scope.agencies = Agency.query({ query: $scope.query })

)
