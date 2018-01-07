require 'rails_helper'

RSpec.describe Player, type: :model do
  describe '#create' do
    context '既に部屋に所属しているとき' do
      let(:room) { Room.new }
      it 'その部屋に所属したまであること' do
        player = Player.create(room: room)
        expect(player.room).to eq room
      end
    end

    context '部屋に所属していないとき' do
      context '所属可能な部屋が存在しないとき' do
        before :each do
          create(:room, status: :in_game)
          create(:room, status: :after_game)
        end

        it '何らかの部屋に所属していること' do
          player = Player.create
          expect(player.room).not_to be_nil
        end

        it '部屋が作成されていること' do
          expect {
            player = Player.create
          }.to change(Room, :count).by 1
        end
      end

      context '所属可能な部屋が存在するとき' do
        before :each do
          @available_room = create(:room, status: :before_game)
          create(:room, status: :in_game)
          create(:room, status: :after_game)
        end

        it 'その部屋に所属していること' do
          player = Player.create
          expect(player.room).to eq @available_room
        end

        it '新たな部屋は作成しないこと' do
          expect {
            player = Player.create
          }.to change(Room, :count).by 0
        end
      end
    end
  end
end
