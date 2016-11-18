set :output, @logger = @logger || Logger.new("#{Rails.root}/log/schedule.log")

every 1.day at: '12:00AM' do
  runner 'GroupsUpdateJob.perform_now'
end