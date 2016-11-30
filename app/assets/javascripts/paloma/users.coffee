Paloma.controller('TravelRequests', {

  show: ->

    activateTravelsList = (enable_travels_list_type, disable_travels_list_type) ->
    #   document.querySelector(".toggle_travels_list.#{enable_travels_list_type}").classList.add("active")
    #   document.querySelector(".toggle_travels_list.#{disable_travels_list_type}").classList.remove("active")
    #   document.querySelector(".travels_list.#{enable_travels_list_type}").classList.add("active")
    #   document.querySelector(".travels_list.#{disable_travels_list_type}").classList.remove("active")

    # document.querySelector('.toggle_travels_list.travels_as_driver').addEventListener 'click', ->
    #   activateTravelsList('travel_requests', 'travel_offers')

    # document.querySelector('.toggle_travels_list.travelas').addEventListener 'click', ->
    #   activateTravelsList('travel_offers', 'travel_requests')

})