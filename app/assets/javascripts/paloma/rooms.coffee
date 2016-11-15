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
      

})