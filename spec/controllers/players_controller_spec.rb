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
      expect(session).to include(:player_id)
    end
  end
end
