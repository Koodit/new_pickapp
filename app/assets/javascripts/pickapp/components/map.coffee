class Pickapp.map

  # Create a new map instance

  constructor: (options) ->
    @debug = true # disable to prevent logging
    @markers = []

    @marker_image = {
      url: window.location.origin + '/map_pointer/1'
      size: new google.maps.Size(50, 50)
      origin: new google.maps.Point(0, 0)
      anchor: new google.maps.Point(0, 0)
    }

    if @debug then console.log('map init', options)

    @map = new google.maps.Map(document.getElementById(options.element), {
      center: options.center || {lat: 45.563384, lng: 8.053154}
      zoom: options.zoom || 18
      minZoom: options.minZoom || 0
      maxZoom: options.maxZoom || 100
      disableDefaultUI: options.disableUI || false
    })

  # Register events for map

  on_event: (event, callback) ->
    @map.addListener(event, callback)

  # Set viewport to position

  set_bounds: (s, w, n, e) ->
    bounds = new google.maps.LatLngBounds({lat: s, lng: w}, {lat: n, lng: e})
    @map.fitBounds(bounds)

  set_center: (new_center) ->
    @map.setCenter(new_center);

  # Get viewport choords

  get_bounds: ->
    @map.getBounds().toJSON()

  # Get viewport visible region

  get_distance: (min_dist) ->
    bounds = @map.getBounds()

    center = bounds.getCenter()
    ne = bounds.getNorthEast()

    # r = radius of the earth in statute miles
    r = 3963.0
    # Convert lat or lng from decimal degrees into radians (divide by 57.2958)
    lat1 = center.lat() / 57.2958
    lon1 = center.lng() / 57.2958
    lat2 = ne.lat() / 57.2958
    lon2 = ne.lng() / 57.2958
    # distance = circle radius from center to Northeast corner of bounds
    dist = r * Math.acos(Math.sin(lat1) * Math.sin(lat2) + Math.cos(lat1) * Math.cos(lat2) * Math.cos(lon2 - lon1))
    if dist < min_dist && min_dist != null
      min_dist
    else 
      dist/3

  # Get Center

  get_center: ->
    @map.getBounds().getCenter().toJSON()

  # Add a new marker to map

  add_marker: (new_marker) ->
    if @debug then console.log('add marker', new_marker)

    marker_to_add = {
      id: new_marker.id || 'no_id'
      css_class: new_marker.css_class || ''
      hover_callback: new_marker.hover_callback || null
      marker_obj: new google.maps.Marker({
        position: {lat: new_marker.choords.lat, lng: new_marker.choords.lng},
        map: @map,
        title: new_marker.title || 'no_title'
        # icon:{
        #   url: window.location.origin + "/map_pointer/" + (@markers.length+1)
        #   size: new google.maps.Size(50, 50)
        #   origin: new google.maps.Point(0, 0)
        #   anchor: new google.maps.Point(0, 0)
        # }
        # optimized: false
      })
    }

    if marker_to_add.hover_callback
      google.maps.event.addListener(marker_to_add.marker_obj, 'mouseover', ->
        marker_to_add.hover_callback(marker_to_add.css_class)
      )
      google.maps.event.addListener(marker_to_add.marker_obj, 'mouseout', ->
        marker_to_add.hover_callback(marker_to_add.css_class)
      )

    @markers.push(marker_to_add)

  # Display a hidden marker

  show_marker: (marker_to_show) ->
    if @debug then console.log('show marker', marker_to_show)
    marker = @markers.filter (m) -> 
      m.id == marker_to_show
    marker[0].marker_obj.setMap(@map)

  # Hide a marker

  hide_marker: (marker_to_hide) ->
    if @debug then console.log('hide marker', marker_to_hide)
    marker = @markers.filter (m) -> 
      m[0] == marker_to_hide
    marker[0].marker_obj.setMap(null)

  # Remove marker from the map

  delete_marker: (marker_to_delete) ->
    if @debug then console.log('delete marker', marker_to_delete)
    @hide_marker(marker_to_delete)
    @markers = @markers.filter (m) -> m[0] != marker_to_delete

  # Set markers to certain map

  set_map_on_all: (map) ->
    if @debug then console.log('set map on all', map)
    for marker in @markers
      marker.marker_obj.setMap(map)

  # Show all markers

  show_markers: ->
    if @debug then console.log('show markers')
    @set_map_on_all(@map)

  # Hide all markers

  hide_markers: ->
    if @debug then console.log('hide markers')
    @set_map_on_all(null)

  # Remove all markers from map

  delete_markers: ->
    if @debug then console.log('delete markers')
    @hide_markers()
    @markers = []
