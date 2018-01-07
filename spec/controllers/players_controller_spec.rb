require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe 'GET #index' do

    context 'プレイヤーになっていない場合' do
      it 'redirect to root' do
        get :index
        expect(response).to redirect_to root_url
      end
    end

    context 'プレイヤーになっている場合' do
      before :each do
        player = create(:player, assigned: true)
        session[:player_id] = player.id
      end

      it 'returns http success' do
        get :index
        expect(response).to have_http_status(:success)
      end

      it 'renders the :index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe 'POST #create' do
    it 'redirect to index' do
      post :create
      expect(response).to redirect_to players_url
    end

    it 'increment player count' do
      expect{
        post :create
      }.to change(Player, :count).by(1)
    end

    it 'add player_id to session' do
      post :create
      expect(session).to include(:player_id)
    end
  end
end
