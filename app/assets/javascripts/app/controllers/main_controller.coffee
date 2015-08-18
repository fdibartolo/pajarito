angular.module('gaviotas.controllers').controller 'MainController',
['$scope', '$translate', 'MainService', ($scope, $translate, MainService) ->

  $scope.languages = [
    {
      key: 'es'
      name: 'Español'
    }
    {
      key: 'en'
      name: 'English'
    }
  ]

  $scope.photos = []

  $scope.getLanguage = () ->
    (language.name for language in $scope.languages when language.key is $translate.use())[0]

  $scope.setLanguage = (lang) ->
    $translate.use lang

  $scope.init = () ->
    if $scope.photos.length is 0
      MainService.photos().then (photos) ->
        angular.forEach photos, (photo) ->
          photo.visible = true
        $scope.photos = photos

  $scope.setVisibility = (cat) ->
    angular.forEach $scope.photos, (photo) ->
      if cat is '*' or photo.categories.indexOf(cat) isnt -1
        photo.visible = true
      else
        photo.visible = false
]