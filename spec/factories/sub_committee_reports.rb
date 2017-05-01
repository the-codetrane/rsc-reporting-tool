FactoryGirl.define do
  factory :sub_committee_report do
    title Faker::Company.buzzword << ' Report'
    attendees { resp = '' ; 10.times {resp << Faker::Name.name + ', '}; resp << Faker::Name.name; resp }
    old_business Faker::Hipster.paragraph
    new_business Faker::Hipster.paragraph
    notes Faker::Hipster.paragraph
    created_by ENV['USER_EMAIL']
    sub_committee_id nil
  end
end
