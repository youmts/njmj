class PlayersController < ApplicationController

  def create
    room = Room.before_game.first || Room.create
    player = Player.create(name: Faker::FunnyName.name, room: room)
    to_be_player(player)
    redirect_to rooms_url
  end
end
