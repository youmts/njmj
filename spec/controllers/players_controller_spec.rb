require 'rails_helper'

RSpec.describe PlayersController, type: :controller do
  describe 'POST #create' do
    it 'redirect to index' do
      post :create
      expect(response).to redirect_to rooms_url
    end

    it 'increment player count' do
      expect{
        post :create
      }.to change(Player, :count).by(1)
    end

    it 'add player_id to session' do
      post :create
      expect(playing?).to be_truthy
    end

    context '所属可能な部屋が存在しないとき' do
      before :each do
        create(:room, status: :in_game)
        create(:room, status: :after_game)
      end

      it '何らかの部屋に所属していること' do
        post :create
        expect(current_player.room).not_to be_nil
      end

      it '部屋が作成されていること' do
        expect {
          post :create
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
        post :create
        expect(current_player.room).to eq @available_room
      end

      it '新たな部屋は作成しないこと' do
        expect {
          post :create
        }.to change(Room, :count).by 0
      end
    end
  end
end
