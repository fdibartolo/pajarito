angular.module('gaviotas.services').factory 'MainService', 
['$q', '$http', ($q, $http) ->

  photos = () ->
    deferred = $q.defer()

    $http.get("/photos")
    .success((data, status) ->
      deferred.resolve data.photos
    ).error (data, status) ->
      deferred.reject()

    deferred.promise

  testimonials = (language) ->
    deferred = $q.defer()

    $http.get("/testimonials?language=#{language}")
    .success((data, status) ->
      deferred.resolve data.testimonials
    ).error (data, status) ->
      deferred.reject()

    deferred.promise

  photos: photos
  testimonials: testimonials
]