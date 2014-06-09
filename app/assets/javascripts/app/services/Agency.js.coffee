@app.factory('Agency', ['$resource', ($resource) ->
  return $resource('/agencies/:agencyId')
])
