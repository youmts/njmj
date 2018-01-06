require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'has many rooms' do
    room = build(:room)
    expect(room).to be_valid
    expect(room.players.count).to eq 1
  end
end
