FactoryBot.define do
  factory :product do
    location { nil }
    name { "MyString" }
    description { "MyText" }
    price { "9.99" }
    available { false }
  end
end
