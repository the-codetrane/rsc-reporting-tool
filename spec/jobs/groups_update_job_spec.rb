require 'rails_helper'

describe GroupsUpdateJob do
  it 'queues jobs accordingly' do
    expect(GroupsUpdateJob.perform_later).to change(GroupsUpdateJob.jobs, :size).by(1)
  end
end
