FactoryGirl.define do
  factory :role do
    name 'Member'

    factory :admin do
      name 'Admin'
    end
  end
end
