FactoryBot.define do
  factory :user do
    sequence(:first_name) { Faker::Name.first_name }
    sequence(:last_name) { Faker::Name.last_name }
    sequence(:email) { Faker::Internet.email }
    password Faker::Internet.password
    role_id 5

    factory :admin_user do
      role_id 1
    end
  end
end
