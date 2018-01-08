FactoryBot.define do
  factory :player do
    association :room
    name "Name"
  end
end
