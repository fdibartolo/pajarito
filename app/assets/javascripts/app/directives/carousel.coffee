angular.module("gaviotas.directives").directive "testimonialCarousel", ->
  link: (scope, element, attr) ->
    scope.$watch 'testimonials', (newValue, oldValue) ->
      $(element).owlCarousel
        navigation : false
        slideSpeed : 300
        paginationSpeed : 400
        singleItem : true

angular.module("gaviotas.directives").directive "photosCarousel", ->
  link: (scope, element, attr) ->
    scope.$watch 'photos', (newValue, oldValue) ->
      $(element).owlCarousel
        pagination : false
        navigation : true
        rewindNav : false
        navigationText : ["<i class='fa fa-chevron-left'></i>", "<i class='fa fa-chevron-right'></i>"]
        slideSpeed : 300
        paginationSpeed : 400
        singleItem : true

    scope.$watch 'currentPhotoIndex', (newValue, oldValue) ->
      $(element).trigger('owl.jumpTo', newValue)
