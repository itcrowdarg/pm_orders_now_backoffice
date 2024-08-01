FactoryBot.define do
  factory :review do
    user { nil }
    location { nil }
    rating { 1 }
    comment { "MyText" }
  end
end
