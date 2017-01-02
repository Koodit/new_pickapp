class Pickapp.mobileApps
  constructor: (options) ->

    disable_mobile_apps = JSON.parse(window.localStorage.getItem('disable_mobile_apps')) || false
    mobile_apps_menu = document.querySelector(options.element)
    disable_button = mobile_apps_menu.querySelector('#close-mobile-apps')
    
    mobile_apps_menu.classList.add('hide') if disable_mobile_apps

    disable_button.addEventListener 'click', (e) ->
      window.localStorage.setItem('disable_mobile_apps', JSON.stringify(true))
      mobile_apps_menu.classList.add('hide')


    # # methods
    #
    # detectMobileMenu = ->
    #   window_width = window.innerWidth
    #   if window_width < 768
    #     document.querySelector(options.element).classList.add('mobile')
    #   else
    #     document.querySelector(options.element).classList.remove('mobile')
    #     document.querySelector(options.element).querySelector('#mobile_menu').classList.remove('open')
    #
    # detectScrollPosition = ->
    #   jumbotron_height = document.querySelector('.jumbotron').getBoundingClientRect().height
    #   if (jumbotron_height-window.pageYOffset) < 100
    #     document.querySelector(options.element).classList.add('in')
    #   else
    #     document.querySelector(options.element).classList.remove('in')
    #
    # registerMobileMenuToggle = ->
    #   mobile_menu_toggle = document.querySelector(options.element).querySelector('#mobile_menu_toggle')
    #   mobile_menu_toggle.addEventListener 'click', ->
    #     if !mobile_menu_open
    #       document.querySelector(options.element).querySelector('#mobile_menu').classList.add('open')
    #     else
    #       document.querySelector(options.element).querySelector('#mobile_menu').classList.remove('open')
    #     mobile_menu_open = !mobile_menu_open
    #
    # # action!
    #
    # if document.querySelector('.jumbotron')
    #   window.addEventListener 'scroll', () ->
    #     detectScrollPosition()
    # else
    #   document.querySelector(options.element).classList.add('in')
    #   document.querySelector('body').classList.add('no_jumbotron')
    #
    # # mobile menu
    #
    # window.addEventListener 'resize', () ->
    #   detectMobileMenu()
    #
    # # init mobile menu
    # detectMobileMenu()
    # registerMobileMenuToggle()
