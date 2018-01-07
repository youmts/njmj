FactoryBot.define do
  factory :player do
    transient do
      assigned false
    end

    name "Name"

    after(:build) do |player, evaluator|
      if evaluator.assigned
        room = create(:room)
        room.players << player
      end
    end
  end
end
