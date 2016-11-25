# For todays date;

Date::today = ->
  (if @getDate() < 10 then '0' else '') + @getDate() + '/' + (if @getMonth() + 1 < 10 then '0' else '') + @getMonth() + 1 + '/' + @getFullYear()

# For the time now

Date::timeNow = ->
  (if @getHours() < 10 then '0' else '') + @getHours() + ':' + (if @getMinutes() < 10 then '0' else '') + @getMinutes() + ':' + (if @getSeconds() < 10 then '0' else '') + @getSeconds()

