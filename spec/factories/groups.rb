FactoryBot.define do
  factory :group do
    name Faker::Company.name << ' Group'
    area nil
  end
end
