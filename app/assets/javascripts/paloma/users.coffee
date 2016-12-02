Paloma.controller('Users', {

  profile: ->

    window.setTravelListType = (travels_list_type) ->
      toggle_travels_list = document.querySelectorAll('.toggle_travels_list')
      travels_list = document.querySelectorAll('.travels_list')

      for ttl in toggle_travels_list
        ttl.classList.remove('active')
        if ttl.getAttribute('data-type') == travels_list_type
          ttl.classList.add('active')

      for tl in travels_list
        tl.classList.remove('active')
        if tl.getAttribute('data-type') == travels_list_type
          tl.classList.add('active')

})