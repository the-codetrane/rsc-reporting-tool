class BmltApi

  JSON_ENDPOINT = 'http://meetings.naworks.org/client_interface/json/?switcher=GetSearchResults&services[]=8&services[]=2&services[]=3&services[]=4&services[]=5&services[]=6&services[]=7&services[]=9&services[]=10&services[]=11&services[]=12&services[]=13&services[]=14&services[]=15&services[]=16&services[]=17&services[]=18&data_field_key=id_bigint,service_body_bigint,meeting_name'

  attr_reader :url
  attr_accessor :response

  def initialize(url)
    @url = url
    @response = nil
  end

  def query
    uri = URI(@url)
    @response = Net::HTTP.get(uri)
  end

  def parse
    self.response = JSON.parse(self.response)
  end

  def update_groups
    self.response.each do |record|
      record.symbolize_keys!
      group = Group.find_by_name(record[:meeting_name])
      if group.present?
        group.update(name: record[:meeting_name], area_id: record[:service_body_bigint])
      else
        Group.create(name: record[:meeting_name], area_id: record[:service_body_bigint])
      end
    end
  end
end