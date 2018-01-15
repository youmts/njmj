require 'rails_helper'

RSpec.describe RoomsController, type: :controller do

  describe 'GET #index' do

    context 'プレイヤーになっていない場合' do
      it 'redirect to root' do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    context 'プレイヤーになっている場合' do
      let(:player) {create(:player)}

      before :each do
        to_be_player(player)
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end

      it 'assigns to player' do
        get :index
        expect(assigns(:player)).to eq player
      end

      it 'assigns to room' do
        get :index
        expect(assigns(:room)).to eq player.room
      end

      it 'assigns to messages' do
        get :index
        expect(player.messages.count).not_to eq 0
        expect(assigns(:messages)).to eq player.room.messages
      end
    end
  end
end
