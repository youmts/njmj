class PlayersController < ApplicationController

  def create
    player = Player.create(name: Faker::FunnyName.name)
    to_be_player(player)
    redirect_to rooms_url
  end
end
