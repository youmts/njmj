FactoryBot.define do
  factory :room do
    name "Name"
    status :before_game

    transient do
      player_count 1
    end

    after(:build) do |room, evaluator|
      create_list(:player, evaluator.player_count, room: room)
    end
  end
end
