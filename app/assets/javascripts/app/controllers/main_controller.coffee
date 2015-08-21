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

  $scope.map = 
    # center: '[-37.334382, -57.030277]'
    zoom: 14
    marker: '[-37.334962, -57.038308]'
    title: 'Gaviotas'
    draggable: false
    visible: true
    mapTypeId: 'HYBRID'

  $scope.getLanguage = () ->
    (language.name for language in $scope.languages when language.key is $translate.use())[0]

  $scope.setLanguage = (lang) ->
    $translate.use lang

  $scope.init = () ->
    if $scope.photos.length is 0
      MainService.photos().then (photos) ->
        angular.forEach photos, (photo, index) ->
          photo.visible = true
          photo.visibleIndex = index
        $scope.photos = photos

  $scope.setVisibility = (cat) ->
    visibleIndex = 0
    angular.forEach $scope.photos, (photo) ->
      if cat is '*' or photo.categories.indexOf(cat) isnt -1
        photo.visible = true
        photo.visibleIndex = visibleIndex
        visibleIndex += 1
      else
        photo.visible = false

  $scope.setCurrentPhotoIndex = (index) ->
    $scope.currentPhotoIndex = index



]