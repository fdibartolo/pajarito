angular.module('gaviotas.controllers').controller 'MainController',
['$scope', '$translate', ($scope, $translate) ->

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

  $scope.getLanguage = () ->
    (language.name for language in $scope.languages when language.key is $translate.use())[0]

  $scope.setLanguage = (lang) ->
    $translate.use lang
]