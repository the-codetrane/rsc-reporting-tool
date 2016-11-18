require 'rails_helper'
ActiveJob::Base.queue_adapter = :test

describe GroupsUpdateJob do
  it 'matches with enqueued job' do
    GroupsUpdateJob.perform_later
    expect(GroupsUpdateJob).to have_been_enqueued
  end
end
