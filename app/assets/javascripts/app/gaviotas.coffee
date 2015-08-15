app = angular.module('gaviotas', ['ngRoute', 'gaviotas.controllers', 'gaviotas.services', 'gaviotas.directives'])

controllers = angular.module('gaviotas.controllers', [])
services = angular.module('gaviotas.services', [])
directives = angular.module('gaviotas.directives', [])

app.config ['$httpProvider', '$routeProvider', ($httpProvider, $routeProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken  
  
  $routeProvider.when '/',
    templateUrl: '/templates/index.html'

  $routeProvider.otherwise redirectTo: '/'
]
