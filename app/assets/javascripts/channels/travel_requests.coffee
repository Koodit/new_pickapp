document.addEventListener "DOMContentLoaded", ->

  domParser = new DOMParser()

  chat = document.querySelector('#travel_request_chat')

  travel_request_message_form = document.querySelector('#new_travel_request_message')

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
    travel_request_id = parseInt(chat.getAttribute('data-travel-request-id'))

    chat_messages_container = chat.querySelector('#chat_messages .iscroll-scroller')

    feed_menu_scroll = new IScroll('#chat_messages', iscroll_opts)
    feed_menu_scroll.scrollTo(0, feed_menu_scroll.maxScrollY, 0)

    App.TravelRequestMessages = App.cable.subscriptions.create({
        channel: "TravelRequestsChannel"
        travel_request_id: travel_request_id
      },
      connected: ->
        console.log "ActionCable on 'TravelRequestsChannel' is connected for travel_id: #{travel_request_id}."

      disconnected: ->
        console.log "ActionCable on 'TravelRequestsChannel' is disconnected for travel_id: #{travel_request_id}."

      received: (data) ->
        console.log(data)
        # chat_message = document.createElement('div')
        # chat_message.classList.add('chat_message')
        # chat_message.classList.add('is_yours') if CURRENT_USER_ID == data.sender_id
        # chat_message.innerHTML = data.public_message
        chat_message = domParser.parseFromString(data.travel_request_message, "text/html").querySelector('.chat_message')
        chat_message.classList.add('is_yours') if CURRENT_USER_ID == data.sender_id
        chat_messages_container.appendChild(chat_message)
        feed_menu_scroll.refresh()
        feed_menu_scroll.scrollTo(0, feed_menu_scroll.maxScrollY, 1000)

      send_message: (content, travel_request_id) ->
        @perform 'send_message', content: content, travel_request_id: travel_request_id

    )

    travel_request_message_form.addEventListener 'submit', (e) ->
      e.preventDefault()
      text_to_send = document.querySelector('#travel_request_message_content').value
      console.log(text_to_send)
      if text_to_send != ''
        App.TravelRequestMessages.send_message(text_to_send, travel_request_id)
        document.querySelector('#travel_request_message_content').value = ''
