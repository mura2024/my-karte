FactoryBot.define do
  factory :exam do
    hospital  { Faker::Team.name }
    exam_date { Faker::Date.in_date_period }
    title     { Faker::Lorem.sentence }
    comment   { Faker::Lorem.sentence }
    association :user
    association :medical

    after(:build) do |exam|
      exam.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end