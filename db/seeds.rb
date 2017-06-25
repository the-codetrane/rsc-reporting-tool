# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
begin
  entries = Dir.open("#{Rails.root}/export_seeds").entries.sort
  entries.shift(2)
  entries.each do |entry|
    data = File.read("#{Rails.root}/export_seeds/#{entry}")
    records = JSON.parse(data)
    model = entry.split('.').first
      records.each do |r|
      model.classify.constantize.first_or_create!(r)
    end
  end
end

AreaReport.destroy_all

777.times do |index|
  attendees = ''
  rand(30).times do
    attendees << Faker::Name.name + ", "
  end
  attendees.chop!
  attendees.chop!
  attendees << "."
  AreaReport.create!(title: Faker::Lorem.word, attendees: attendees , area_status: Faker::Lorem.word,
  area_needs: Faker::Lorem.paragraph, events: Faker::Lorem.paragraph,
  news: Faker::Lorem.paragraph, motions: Faker::Lorem.paragraph, notes: Faker::Lorem.paragraph,
  area_id: Area.ids.sample, created_at: Faker::Date.backward(365),
  updated_at: Faker::Date.backward(1000), created_by: "leatherdaddy63@juno.net",
  edited_by: "N.A.", donation: Faker::Commerce.price)
end

puts "#{AreaReport.all.count} entries created successfully."
