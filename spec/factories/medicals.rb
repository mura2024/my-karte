FactoryBot.define do
  factory :medical do
    subject { Faker::Team.name }
    association :user
  end
end
