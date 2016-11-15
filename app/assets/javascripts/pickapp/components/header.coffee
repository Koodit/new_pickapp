class Pickapp.header
  constructor: (options) ->

    if document.querySelector('.jumbotron')
      window.addEventListener 'scroll', () ->
        jumbotron_height = document.querySelector('.jumbotron').getBoundingClientRect().height
        if (jumbotron_height-window.pageYOffset) < 100
          document.querySelector(options.element).classList.add('in')
        else
          document.querySelector(options.element).classList.remove('in')
    else
      document.querySelector(options.element).classList.add('in')
      document.querySelector('body').classList.add('no_jumbotron')