angular.module("gaviotas.directives").directive "testimonialCarousel", ->
  link: (scope, element, attr) ->
    $(element).owlCarousel
      navigation : false
      slideSpeed : 300
      paginationSpeed : 400
      singleItem : true
