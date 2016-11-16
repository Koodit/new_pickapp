document.addEventListener "DOMContentLoaded", ->

  domParser = new DOMParser()

  chat = document.querySelector('#chat')

  new_public_message_form = document.querySelector('#new_public_message')

  iscroll_opts = {
    snap: false
    momentum: true
    scrollbars: true
    mouseWheel: true
    click: true
    tap: false
    desktopCompatibility: true
    vScroll: true
    hScroll: false
    hScrollbar: false
    lockDirection: true
  }

  if chat != null
    travel_id = parseInt(chat.getAttribute('data-travel-id'))

    chat_messages_container = chat.querySelector('#chat_messages .iscroll-scroller')

    feed_menu_scroll = new IScroll('#chat_messages', iscroll_opts)
    feed_menu_scroll.scrollTo(0, feed_menu_scroll.maxScrollY, 0)

    App.TravelPublicMessages = App.cable.subscriptions.create({
        channel: "TravelsChannel"
        travel_id: travel_id
      },
      connected: ->
        console.log "ActionCable on 'TravelsChannel' is connected for travel_id: #{travel_id}."

      disconnected: ->
        console.log "ActionCable on 'TravelsChannel' is disconnected for travel_id: #{travel_id}."

      received: (data) ->
        # chat_message = document.createElement('div')
        # chat_message.classList.add('chat_message')
        # chat_message.classList.add('is_yours') if CURRENT_USER_ID == data.sender_id
        # chat_message.innerHTML = data.public_message
        chat_message = domParser.parseFromString(data.public_message, "text/html").querySelector('.chat_message')
        chat_message.classList.add('is_yours') if CURRENT_USER_ID == data.sender_id
        chat_messages_container.appendChild(chat_message)
        feed_menu_scroll.refresh()
        feed_menu_scroll.scrollTo(0, feed_menu_scroll.maxScrollY, 1000)

      send_message: (content, travel_id) ->
        @perform 'send_message', content: content, travel_id: travel_id
        
    )

    new_public_message_form.addEventListener 'submit', (e) ->
      e.preventDefault()
      text_to_send = document.querySelector('#public_message_content').value
      if text_to_send != ''
        App.TravelPublicMessages.send_message(text_to_send, travel_id)
        document.querySelector('#public_message_content').value = ''
      