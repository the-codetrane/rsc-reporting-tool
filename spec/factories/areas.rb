FactoryBot.define do
  factory :area do
    sequence(:name) {Faker::Address.city << ' Area'}
    sequence(:county) {Faker::Address.city}
  end
end
