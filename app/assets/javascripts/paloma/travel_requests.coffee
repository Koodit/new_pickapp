Paloma.controller('TravelRequests', {

  show: ->
    # Room Map

    travel_map = new Pickapp.map({
      element: 'travel-map'
      zoom: 15
      minZoom: 15
      maxZoom: 20
      center: {lat: this.params.travel_request.lat, lng: this.params.travel_request.lng}
      disableUI: true
      draggable: false
    })

    travel_map.add_marker({id:'travel', choords: {lat: this.params.travel_request.lat, lng: this.params.travel_request.lng} })

    window.onShowUserProfile = (elmt, user_id) ->
      event.preventDefault();
      $.get( "#{window.location.protocol}//#{window.location.host}/api/users/#{user_id}/profile", (resp) ->
        $( window.generateProfileModal(resp) ).appendTo('body').modal();
      )
      
    

  new: ->
    current_date = new Date().timeNow()
    flatpickr_config = {
      altFormat: "j F Y - H:i",
      altInput: true,
      minDate: current_date,
      defaultDate: current_date,
      enableTime: true,
      time_24hr: true,
      locale:'it',
      disableMobile: true
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
