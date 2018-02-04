namespace :bmlt do
  desc 'Query and parse BMLT API'
  task query: :environment do
    require 'bmlt_api'
    b = BmltApi.new
    b.query
    b.parse
    b.update_groups
  end
end
