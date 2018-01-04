class PlayersController < ApplicationController
  def index
  end

  def create
    redirect_to players_url
  end
end
