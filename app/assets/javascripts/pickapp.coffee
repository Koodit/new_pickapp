document.addEventListener "DOMContentLoaded", ->
  Paloma.start()

  main_header = new Pickapp.header({element: '#main_header'})
  mobile_apps = new Pickapp.mobileApps({element: '#mobile_apps'})
