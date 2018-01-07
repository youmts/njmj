require 'rails_helper'

RSpec.describe Room, type: :model do
  it 'has some players' do
    room = build(:room)
    expect(room).to be_valid
    expect(room.players.count).to eq 1
  end

  describe 'Room.assign_available_room' do
    let(:new_player) { build(:player) }

    context 'openの部屋がない場合' do
      before :each do
        create(:room, status: :playing)
        create(:room, status: :close)
      end

      it 'assign the player to new room' do
        room = nil
        expect {
          room = Room.assign_to_available_room(new_player)
        }.to change(Room, :count).by(1)

        expect(new_player.room).to eq room
      end
    end

    context 'openの部屋がある場合' do
      before :each do
        @open_room = create(:room, status: :open)
        create(:room, status: :playing)
        create(:room, status: :close)
      end

      it 'assign the player to the open room' do
        room = nil
        expect {
          room = Room.assign_to_available_room(new_player)
        }.to change(Room, :count).by(0)
        expect(new_player.room).to eq @open_room
        expect(room).to eq @open_room
      end
    end
  end
end
