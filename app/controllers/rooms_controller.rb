class RoomsController < ApplicationController
  before_action :redirect_not_playing

  def index
    @player = current_player
    @room = current_player.room
    @messages = @room.messages.includes(:player)
  end
end
