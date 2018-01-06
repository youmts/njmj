class PlayersController < ApplicationController
  before_action :as_player, except: [:create]

  def index
    @player = current_player
  end

  def create
    # TODO: roomモデルに入れるroomを検索させるようにする
    player = Player.create(name: Faker::FunnyName.name, room: Room.create())
    to_be_player(player)
    redirect_to players_url
  end

  private

    def as_player
      redirect_to(root_url) unless as_player?
    end
end
