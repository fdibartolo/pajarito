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

  submitQuestion = (question) ->
    deferred = $q.defer()

    $http.post("/contact_us",
      question:
        name: question.name
        email: question.email
        body: question.message
    ).then (response) ->
      deferred.resolve()
    , (response) ->
      deferred.reject()

    deferred.promise

  photos: photos
  testimonials: testimonials
  submitQuestion: submitQuestion
]