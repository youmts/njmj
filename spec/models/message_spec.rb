require 'rails_helper'

RSpec.describe Message, type: :model do
  describe 'after_create_commit' do
    let(:player) { create(:player) }
    let(:message) { build(:message, room: player.room, player: player) }

    it 'エラーなくMessageBroadCastJob.perform_laterを呼び出すこと' do
      expect(MessageBroadcastJob).to receive(:perform_later).once.with(message)
      expect{ message.save! }.not_to raise_error
    end
  end
end
