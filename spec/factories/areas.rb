FactoryGirl.define do
  factory :area do
    name Faker::Address.city << ' Area'
    county Faker::Address.city
    user nil
  end
end
