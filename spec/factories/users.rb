FactoryBot.define do
  factory :user do
    last_name              { Faker::Lorem.word }
    first_name             { Faker::Lorem.word }
    email                  { "#{Faker::Internet.unique.email}#{rand(999999)}" }
    password               { '1aA@345678' }
    password_confirmation  { '1aA@345678' }
  end
end
