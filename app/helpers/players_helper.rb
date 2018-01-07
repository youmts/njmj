module PlayersHelper
  def to_be_player(player)
    session[:player_id] = player.id
  end

  def current_player
    if (player_id = session[:player_id])
      @current_player ||= Player.find(player_id)
    end
  end

  def playing?
    !current_player.nil?
  end

  def redirect_not_playing
    redirect_to(root_url) unless playing?
  end
end
