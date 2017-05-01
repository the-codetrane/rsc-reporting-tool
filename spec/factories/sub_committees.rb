FactoryGirl.define do
  factory :sub_committee do |f|
    f.name Faker::Company.name << ' Sub-Committee'
  end
end
