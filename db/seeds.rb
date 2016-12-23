# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

entries = Dir.open("#{Rails.root}/export_seeds").entries
entries.shift(2)
entries.each do |entry|
  data = File.read("#{Rails.root}/export_seeds/#{entry}")
  records = JSON.parse(data)
  model = entry.split('.').first
  records.each { |r| model.classify.constantize.create(r) }
end
