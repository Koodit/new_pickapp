
window.Pickapp = {
  is_mobile: ->
    window.innerWidth <= 768

  is_desktop: ->
    window.innerWidth >= 992
}