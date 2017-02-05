FactoryGirl.define do
  factory :area_report do
    title Faker::Company.buzzword << ' Area Report'
    attendees { resp = '' ; 10.times {resp << Faker::Name.name + ', '}; resp << Faker::Name.name; resp }
    area_status Faker::Hipster.paragraph
    area_needs Faker::Hipster.paragraph
    events Faker::Hipster.paragraph
    news Faker::Hipster.paragraph
    motions Faker::Hipster.paragraph
    notes Faker::Hipster.paragraph
    created_by ENV['USER_EMAIL']
  end
end
