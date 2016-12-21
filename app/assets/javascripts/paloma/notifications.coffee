Paloma.controller('Notifications', {

  index: ->
    window.setNotificationsListType = (notifications_list_type) ->
      nc_section_toggles = document.querySelectorAll('.ncs-toggle')
      notification_lists = document.querySelectorAll('.nc-section')

      for nst in nc_section_toggles
        nst.classList.remove('active')
        if nst.getAttribute('data-type') == notifications_list_type
          nst.classList.add('active')

      for nl in notification_lists
        nl.classList.remove('active')
        if nl.getAttribute('data-type') == notifications_list_type
          nl.classList.add('active')

})
