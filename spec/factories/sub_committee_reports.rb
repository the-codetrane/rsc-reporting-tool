FactoryGirl.define do
  factory :sub_committee_report do
    title Faker::Company.buzzword << ' Report'
    attendees { resp = ''; 10.times { resp << Faker::Name.name + ', ' }; resp << Faker::Name.name; resp }
    old_business Faker::Hipster.paragraph
    new_business Faker::Hipster.paragraph
    notes Faker::Hipster.paragraph
    created_by ENV['USER_EMAIL']
    sequence(:sub_committee_id) { Faker::Number.between(1, 20) }
  end
end
