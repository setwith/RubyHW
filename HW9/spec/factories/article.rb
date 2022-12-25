FactoryBot.define do
  factory :article do
    title { Faker::Name.name }
    body  { Faker::Name.name }
  end
end
