# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

%w(area role group sub_committee).each do |entry|
  data = File.read("#{Rails.root}/export_seeds/#{entry + '.json'}")
  records = JSON.parse(data)
  model = entry.split('.').first
  records.each do |r|
    model.classify.constantize.create(r)
  end
end
