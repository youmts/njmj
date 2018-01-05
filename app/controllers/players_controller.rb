class PlayersController < ApplicationController
  before_action :as_player, except: [:create]

  def index
    @player = current_player
  end

  def create
    player = Player.create(name: Faker::FunnyName.name)
    to_be_player(player)
    redirect_to players_url
  end

  private

    def as_player
      redirect_to(root_url) unless as_player?
    end
end
