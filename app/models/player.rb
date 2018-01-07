class Player < ApplicationRecord
  before_validation :assign_to_room
  belongs_to :room

  private
    def assign_to_room
      self.room ||= Room.before_game.first || Room.create
    end
end
