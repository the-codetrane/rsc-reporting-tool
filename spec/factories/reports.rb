FactoryGirl.define do
  factory :report do |f|
    f.title Faker::Company.buzzword << ' Report'
    f.committee Faker::Company.name << ' Committee'
    f.attendees "MyString"
    f.old_business "MyText"
    f.new_business "MyText"
    f.created_by
    f.notes "MyText"
  end
end
