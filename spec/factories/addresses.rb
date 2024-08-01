FactoryBot.define do
  factory :address do
    user { nil }
    address_line { "MyString" }
    city { "MyString" }
    state { "MyString" }
    postal_code { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
