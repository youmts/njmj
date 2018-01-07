require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'has some players' do
    room = build(:room)
    expect(room).to be_valid
    expect(room.players.count).to eq 1
  end
end
