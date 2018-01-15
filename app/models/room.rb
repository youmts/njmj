class Room < ApplicationRecord
  has_many :players
  has_many :messages
  enum status: { before_game: 0, in_game: 1, after_game: 2 }

end
