class Room < ApplicationRecord
  has_many :players
  enum status: { open: 0, playing: 1, close: 2 }

  class << self
    def assign_to_available_room(player)
      unless(open_room = Room.open.first)
        open_room = Room.create
      end
      open_room.players << player
      open_room
    end
  end
end
