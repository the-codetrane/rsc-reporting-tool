class GroupsUpdateJob < ApplicationJob
  queue_as :default

  def perform
    api = BmltApi.new(BmltApi::JSON_ENDPOINT)
    api.query
    api.parse
    api.update_groups
  end
end
