angular.module("gaviotas.directives").directive "imageFilter", ($window) ->
  link: (scope, element, attr) ->
    $('.cat a').bind 'click', ->
      $('.cat .active').removeClass 'active'
      $(this).addClass 'active'
      selector = $(this).attr('data-filter')
      $(element).isotope
        filter: selector
        animationOptions:
          duration: 750
          easing: 'linear'
          queue: false
      false

    $(element).isotope
      filter: '*'
      animationOptions:
        duration: 750
        easing: 'linear'
        queue: false
