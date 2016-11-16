document.addEventListener "DOMContentLoaded", ->
  chat = document.querySelector('#chat')
  new_public_message_form = document.querySelector('#new_public_message')

  if chat != null
    travel_id = parseInt(chat.getAttribute('data-travel-id'))

    App.TravelPublicMessages = App.cable.subscriptions.create({
        channel: "TravelsChannel"
        travel_id: travel_id
      },
      connected: ->
        console.log "ActionCable on 'TravelsChannel' is connected for travel_id: #{travel_id}."

      disconnected: ->
        console.log "ActionCable on 'TravelsChannel' is disconnected for travel_id: #{travel_id}."

      received: (data) ->
        chat.innerHTML = chat.innerHTML + data.public_message

      send_message: (content, travel_id) ->
        @perform 'send_message', content: content, travel_id: travel_id
        
    )

    new_public_message_form.addEventListener 'submit', (e) ->
      e.preventDefault()
      text_to_send = document.querySelector('#public_message_content').value
      if text_to_send != ''
        App.TravelPublicMessages.send_message(text_to_send, travel_id)
        document.querySelector('#public_message_content').value = ''
      