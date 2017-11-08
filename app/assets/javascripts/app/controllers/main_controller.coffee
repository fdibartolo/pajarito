angular.module('gaviotas.controllers').controller 'MainController',
['$scope', '$translate', 'toaster', 'Constants', 'MainService', ($scope, $translate, toaster, Constants, MainService) ->

  $scope.siteName = Constants.siteName

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
  $scope.testimonials = []

  $scope.map = 
    url: "https://maps.googleapis.com/maps/api/js?key=AIzaSyBiKJsRDFbTPVGTB4SwsXfaVj_sXgL7Jks"
    # center: '[-37.334382, -57.030277]'
    zoom: 14
    marker: '[-37.334962, -57.038308]'
    title: Constants.siteName
    draggable: false
    visible: true
    mapTypeId: 'HYBRID'
    # largeView: 'http://www.google.com/maps/place/-37.334962,-57.038308/@-37.334962,-57.038308,15z'

  $scope.init = () ->
    if $scope.photos.length is 0
      MainService.photos().then (photos) ->
        angular.forEach photos, (photo, index) ->
          photo.visible = true
          photo.visibleIndex = index
        $scope.photos = photos
    if $scope.testimonials.length is 0
      MainService.testimonials(Constants.defaultLanguageKey).then (testimonials) ->
        $scope.testimonials = testimonials
    clearQuestion()

  $scope.getLanguage = () ->
    (language.name for language in $scope.languages when language.key is $translate.use())[0]

  $scope.setLanguage = (lang) ->
    $translate.use lang

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

  $scope.submitQuestion = () ->
    if validForm()
      MainService.submitQuestion($scope.question).then (() ->
        $translate('CONTACT_SUBMIT_SUCCESS').then (message) ->
          toaster.pop 'success', '', message, 10000
          clearQuestion()
      ), () ->
        $translate('CONTACT_SUBMIT_ERROR').then (message) ->
          toaster.pop 'error', '', message, 10000

  validForm = () ->
    $scope.question.invalidName    = $scope.question.name is ''
    $scope.question.invalidEmail   = $scope.question.email is ''
    $scope.question.invalidMessage = $scope.question.message is ''

    not ($scope.question.invalidName or $scope.question.invalidEmail or $scope.question.invalidMessage)

  clearQuestion = () ->
    $scope.question =
      name: ''
      email: ''
      message: ''
]