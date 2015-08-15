angular.module("gaviotas.directives").directive "pageScroll", ->
  link: (scope, element, attr) ->
    element.bind "click", (event) ->
      if location.pathname.replace(/^\//, '') == @pathname.replace(/^\//, '') and location.hostname == @hostname
        target = $(@hash)
        target = if target.length then target else $('[name=' + @hash.slice(1) + ']')
        if target.length
          $('html,body').animate { scrollTop: target.offset().top - 40 }, 900
    return

angular.module("gaviotas.directives").directive "scrollMenuSpy", ($window) ->
  link: (scope, element, attr) ->
    angular.element($window).bind 'scroll', ->
      navHeight = $(window).height() - 100;
      if ($(window).scrollTop() > navHeight)
        $('.navbar-default').addClass('on')
      else
        $('.navbar-default').removeClass('on')

    $(element).scrollspy
      target: '.navbar-default'
      offset: 80
