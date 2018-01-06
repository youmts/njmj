FactoryBot.define do
  factory :room do
    name "MyString"

    after(:build) do |room|
      create_list(:player, 1, room: room)
    end
  end
end
