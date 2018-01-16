module PlayersHelper
  def to_be_player(player)
    cookies.signed[:player_id] = {
      value: player.id,
      expires: 1.day.from_now,
      httponly: true,
    }
  end

  def current_player
    if (player_id = cookies.signed[:player_id])
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
