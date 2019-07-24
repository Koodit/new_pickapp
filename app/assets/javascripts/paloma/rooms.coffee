Paloma.controller('Rooms', {

  show: ->
    # Room Map

    room_map = new Pickapp.map({
      element: 'room_map'
      zoom: 15
      minZoom: 15
      maxZoom: 20
      center: {lat: this.params.room.latitude, lng: this.params.room.longitude}
      disableUI: true
      draggable: false
    })

    room_map.add_marker({id:'room', choords: {lat: this.params.room.latitude, lng: this.params.room.longitude} })

    activateTravelsList = (enable_travels_list_type, disable_travels_list_type) ->
      document.querySelector(".toggle_travels_list.#{enable_travels_list_type}").classList.add("active")
      document.querySelector(".toggle_travels_list.#{disable_travels_list_type}").classList.remove("active")
      document.querySelector(".travels_list.#{enable_travels_list_type}").classList.add("active")
      document.querySelector(".travels_list.#{disable_travels_list_type}").classList.remove("active")

    document.querySelector('.toggle_travels_list.travel_requests').addEventListener 'click', ->
      activateTravelsList('travel_requests', 'travel_offers')

    document.querySelector('.toggle_travels_list.travel_offers').addEventListener 'click', ->
      activateTravelsList('travel_offers', 'travel_requests')

    activateTravelsList('travel_offers', 'travel_requests')

  search: ->

    # towards_room
    towards_room_check = document.querySelector('.towards_room_check')

    towards_room_check.addEventListener 'change', (ev) ->
      if ev.srcElement.checked
        document.querySelector('#towards_room_check_text').innerHTML = 'PER:'
      else
        document.querySelector('#towards_room_check_text').innerHTML = 'DA:'

    current_date = new Date().timeNow()
    min_departure_datetime = this.params.min_departure_datetime
    max_departure_datetime = this.params.max_departure_datetime

    flatpickr_config = {
      altFormat: "j F Y - H:i",
      altInput: true,
      minDate: current_date,
      defaultDate: min_departure_datetime or current_date,
      enableTime: true,
      time_24hr: true,
      locale:'it',
      disableMobile: true,
      onChange: (selectedDates, dateStr, instance) ->
        setBackDepartureDatetimePicker(selectedDates[0])
    }
    document.getElementById("start_datetime_picker").flatpickr(flatpickr_config)

    # back_departure_datetime
    back_departure_datetime_picker = null

    setBackDepartureDatetimePicker = (departure_datetime) ->
      back_departure_datetime_picker.destroy() if back_departure_datetime_picker

      if departure_datetime
        min_date = departure_datetime
      else
        min_date = current_date

      flatpickr_config = {
        altFormat: "j F Y - H:i",
        altInput: true,
        minDate: new Date(min_date - 60000),
        defaultDate: max_departure_datetime or min_date,
        enableTime: true,
        time_24hr: true,
        locale:'it'
      }
      back_departure_datetime_picker = document.getElementById("end_datetime_picker").flatpickr(flatpickr_config)

    setBackDepartureDatetimePicker()

})
