FactoryBot.define do
  factory :room do
    name "Name"
    status :open

    transient do
      player_count 1
    end

    after(:build) do |room, evaluator|
      create_list(:player, evaluator.player_count, room: room)
    end
  end
end
