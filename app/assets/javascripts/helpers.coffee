# For todays date;

Date::today = ->
  (if @getDate() < 10 then '0' else '') + @getDate() + '/' + (if @getMonth() + 1 < 10 then '0' else '') + @getMonth() + 1 + '/' + @getFullYear()

# For the time now

Date::timeNow = ->
  (if @getHours() < 10 then '0' else '') + @getHours() + ':' + (if @getMinutes() < 10 then '0' else '') + @getMinutes() + ':' + (if @getSeconds() < 10 then '0' else '') + @getSeconds()

# Generate ProfileModal

window.isStarred = (val, check) ->
  if val == null then val = 2
  val = (2 * Math.round(val/2))
  console.log 'paired', val, check if val == check || val == 0 || !val
  if val == check 
    "checked"
  else
    return null


window.generateProfileModal = (data) ->
  out = ""
  out += "<div class='modal profile-modal'>"
  out += "  <div class='user-card'>"
  out += "    <div class='profile-image' style='background-image: url(#{data.profile_image_url || '#'})'></div>"
  out += "    <div class='user-name'>#{data.name} #{data.surname}</div>"
  out += "  </div>"
  out += "  <ul class='external-meta-list'>"
  out += "    <li>"
  out += "      <i class='fa fa-calendar'></i>"
  out += "      <span>Iscritto dal: <strong>#{data.created_at}</strong></span>"
  out += "    </li>"
  out += "    <li>"
  out += "      <i class='fa fa-car'></i>"
  out += "      <span>Numero di Viaggi: <strong>#{data.travels_count}</strong></span>"
  out += "    </li>"
  out += "  </ul>"
  out += "  <div class='user-reviews reviews_pane'>"
  out += "    <div class='reviews'>"

  for r in data.received_reviews
    out += "    <form class='review'>"
    out += "      <p>Recensione di #{r.user.name || ''} #{r.user.surname || ''}</p>"
    out += "      <div class='content'>#{r.content || ''}</div>"
    out += "      <div class='meta'>"
    out += "        <fieldset class='starability-basic stars disabled' name='review-#{r.id}'>"
    out += "          <input id='review-#{r.id}-5' name='rating' type='radio' value='10' disabled='true' #{isStarred(r.rating, 10)}>"
    out += "          <label for='review-#{r.id}-5' title='5'>5 stars</label>"
    out += "          <input id='review-#{r.id}-4' name='rating' type='radio' value='8' disabled='true' #{isStarred(r.rating, 8)}>"
    out += "          <label for='review-#{r.id}-4' title='4'>4 stars</label>"
    out += "          <input id='review-#{r.id}-3' name='rating' type='radio' value='6' disabled='true' #{isStarred(r.rating, 6)}>"
    out += "          <label for='review-#{r.id}-3' title='3'>3 stars</label>"
    out += "          <input id='review-#{r.id}-2' name='rating' type='radio' value='4' disabled='true' #{isStarred(r.rating, 4)}>"
    out += "          <label for='review-#{r.id}-2' title='2'>2 stars</label>"
    out += "          <input id='review-#{r.id}-1' name='rating' type='radio' value='2' disabled='true' #{isStarred(r.rating, 2)}>"
    out += "          <label for='review-#{r.id}-1' title='1'>1 stars</label>"
    out += "        </fieldset>"
    out += "      </div>"
    out += "    </form>"

  out += "    </div>"
  out += "  </div>"
  out += "</div>"
  return out
