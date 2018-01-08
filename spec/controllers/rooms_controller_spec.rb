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
      before :each do
        to_be_player(create(:player))
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
end
