# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



# %w(area role group sub_committee).each do |entry|
#  data = File.read("#{Rails.root}/export_seeds/#{entry + '.json'}")
#  records = JSON.parse(data)
#  model = entry.split('.').first
#  records.each do |r|
#    model.classify.constantize.create(r)
#  end
# end

User.destroy_all

  30.times do
    User.create!(email: Faker::Internet.unique.email, password: Faker::Internet.password, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name,
      group_id: Group.all.sample.id, sub_committee_id: 2, role_id: 1)
  end

AreaReport.destroy_all

  300.times do
    attendees = ''
    (rand * 10).to_i.times {attendees << Faker::Name.name + ' '}

    AreaReport.create!(title: Faker::Lorem.sentence, attendees: attendees, area_status: Faker::Lorem.sentence,
    area_needs: Faker::Lorem.paragraph, events: Faker::Lorem.paragraph,
    news: Faker::Lorem.paragraph, motions: Faker::Lorem.paragraph, notes: Faker::Lorem.paragraph,
    area_id: Area.all.sample.id, created_at: Faker::Date.backward(365),
    updated_at: Faker::Date.backward(365), created_by: User.all.sample.email,
    edited_by: 'N.A.', donation: Faker::Commerce.price * 100)
  end

puts "#{AreaReport.all.count} area reports successfully created."
puts "#{User.all.count} users successfully created."
