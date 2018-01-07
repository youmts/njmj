require 'rails_helper'

RSpec.describe Player, type: :model do
  context 'in room' do
    let(:room) { Room.new }
    it 'belongs to the room after create' do
      player = Player.create(room: room)
      expect(player.room).to eq room
    end
  end

  context 'not in room' do
    context 'when there are no available rooms' do
      before :each do
        create(:room, status: :in_game)
        create(:room, status: :after_game)
      end

      it 'belongs to new room after create' do
        player = Player.create
        expect(player.room).not_to be_nil
      end

      it 'creates new room' do
        expect {
          player = Player.create
        }.to change(Room, :count).by 1
      end
    end

    context 'when there are any available rooms 'do
      before :each do
        @available_room = create(:room, status: :before_game)
        create(:room, status: :in_game)
        create(:room, status: :after_game)
      end

      it 'belongs to new room after create' do
        player = Player.create
        expect(player.room).not_to be_nil
      end

      it 'not creates new room' do
        expect {
          player = Player.create
        }.to change(Room, :count).by 0
      end

      it 'belonged room is the available room' do
        player = Player.create
        expect(player.room).to eq @available_room
      end
    end
  end
end
