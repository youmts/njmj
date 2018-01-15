FactoryBot.define do
  factory :player do
    association :room
    name "Name"

    after(:build) do |player|
      player.messages << build(:message, room: player.room, player: player)
    end
  end
end
