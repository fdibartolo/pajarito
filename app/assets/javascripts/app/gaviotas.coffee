app = angular.module('gaviotas', ['ngRoute', 'ngSanitize', 'pascalprecht.translate', 'ngMap', 'gaviotas.controllers', 'gaviotas.services', 'gaviotas.directives', 'gaviotas.constants'])

controllers = angular.module('gaviotas.controllers', [])
services = angular.module('gaviotas.services', [])
directives = angular.module('gaviotas.directives', [])
constants = angular.module('gaviotas.constants', [])

app.config ['$httpProvider', '$routeProvider', ($httpProvider, $routeProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken  
  
  $routeProvider.when '/',
    templateUrl: '/templates/index.html'

  $routeProvider.otherwise redirectTo: '/'
]

app.config ['$translateProvider', ($translateProvider) ->
  $translateProvider.useStaticFilesLoader
    prefix: '/assets/app/languages/'
    suffix: '.json'
  $translateProvider.preferredLanguage 'es'
  
  # Enable escaping of HTML
  $translateProvider.useSanitizeValueStrategy 'escaped'
  return
]
