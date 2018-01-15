class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_for current_player.room
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    Message.create! content: data['message'],
                    room: current_player.room,
                    player: current_player
  end
end
