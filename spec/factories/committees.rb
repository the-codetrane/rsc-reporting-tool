FactoryGirl.define do
  factory :committee do |f|
    f.name Faker::Company.name << ' Committee'
  end
end
