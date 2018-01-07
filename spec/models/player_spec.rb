require 'rails_helper'

RSpec.describe Player, type: :model do
  it 'belongs to room' do
    player = build(:player, assigned: true)
    expect(player).to be_valid
    expect(player.room).not_to be_nil
  end
end
