Paloma.controller('TravelRequests', {

  new: ->
    current_date = new Date().timeNow()
    flatpickr_config = {
      dateFormat: "j F Y - H:i"
      minDate: current_date,
      defaultDate: current_date,
      enableTime: true,
      time_24hr: true,
      locale:'it'
    }
    document.getElementById("one_way_datetime").flatpickr(flatpickr_config)

    towards_room_check = document.querySelector('.towards_room_check')

    towards_room_check.addEventListener 'change', (ev) ->
      if ev.srcElement.checked
        document.querySelector('.towards_room_label_text').innerHTML = 'Verso'
        document.querySelector('.desired_address_label_text').innerHTML = 'Indirizzo di Partenza'
      else
        document.querySelector('.towards_room_label_text').innerHTML = 'Da'
        document.querySelector('.desired_address_label_text').innerHTML = 'Indirizzo di Destinazione'

    
      

})