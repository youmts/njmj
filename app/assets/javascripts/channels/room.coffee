$(document).on "turbolinks:load", ->
  if $("body.rooms.index").length > 0
    App.room = App.cable.subscriptions.create "RoomChannel",
      connected: ->
        # Called when the subscription is ready for use on the server

      disconnected: ->
        # Called when the subscription has been terminated by the server

      received: (data) ->
        $('#messages').append data['message']

      speak: (message) ->
        @perform 'speak', message: message

$(document).on "turbolinks:visit", ->
  if $("body.rooms.index").length > 0
    App.room.unsubscribe()
    App.room = null


$(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
  if event.keyCode is 13 # return = send
    App.room.speak event.target.value
    event.target.value = ''
    event.preventDefault()