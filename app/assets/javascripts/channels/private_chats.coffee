document.addEventListener "DOMContentLoaded", ->

  domParser = new DOMParser()

  chat = document.querySelector('#private_chat')

  new_private_message_form = document.querySelector('#new_private_message')

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
    private_chat_id = parseInt(chat.getAttribute('data-private-chat-id'))

    chat_messages_container = chat.querySelector('#chat_messages .iscroll-scroller')

    private_chat_scroll = new IScroll('#chat_messages', iscroll_opts)
    private_chat_scroll.scrollTo(0, private_chat_scroll.maxScrollY, 0)

    App.PrivateChatMessages = App.cable.subscriptions.create({
        channel: "PrivateChatsChannel"
        private_chat_id: private_chat_id
      },
      connected: ->
        console.log "ActionCable on 'PrivateChatsChannel' is connected for private_chat_id: #{private_chat_id}."

      disconnected: ->
        console.log "ActionCable on 'PrivateChatsChannel' is disconnected for private_chat_id: #{private_chat_id}."

      received: (data) ->
        chat_message = domParser.parseFromString(data.private_message, "text/html").querySelector('.chat_message')
        chat_message.classList.add('is_yours') if CURRENT_USER_ID == data.sender_id
        chat_messages_container.appendChild(chat_message)
        private_chat_scroll.refresh()
        private_chat_scroll.scrollTo(0, private_chat_scroll.maxScrollY, 1000)

      send_message: (content, private_chat_id) ->
        @perform 'send_message', content: content, private_chat_id: private_chat_id
        
    )

    new_private_message_form.addEventListener 'submit', (e) ->
      e.preventDefault()
      text_to_send = document.querySelector('#private_message_content').value
      if text_to_send != ''
        App.PrivateChatMessages.send_message(text_to_send, private_chat_id)
        document.querySelector('#private_message_content').value = ''
      