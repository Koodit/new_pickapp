Paloma.controller('Home', {

  index: ->
    # Room Map

    # fake
    this.params.room = {}
    this.params.room.latitude = 45.563384
    this.params.room.longitude = 8.053154

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

})