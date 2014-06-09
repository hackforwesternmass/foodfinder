@app.controller('SearchCtrl', ($scope, Agency) ->

  $scope.agencies = Agency.query()

  $scope.performSearch = ->
    $scope.agencies = Agency.query({ query: $scope.query })

)
