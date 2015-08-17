angular.module('gaviotas.services').factory 'MainService', 
['$q', '$http', ($q, $http) ->

  photos = (id) ->
    deferred = $q.defer()

    $http.get("/photos")
    .success((data, status) ->
      deferred.resolve data.photos
    ).error (data, status) ->
      deferred.reject()

    deferred.promise

  photos: photos
]