FactoryGirl.define do
  factory :group do
    name Faker::Company.name << ' Group'
    area nil
    anniversary Faker::Date.between(20.years.ago, 1.year.ago)
  end
end
