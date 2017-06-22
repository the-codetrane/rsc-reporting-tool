class ChartsController < ApplicationController
  def index
    @total_donations = {}
    AreaReport.all.each do |report|
      id = report[:area_id]
      name = Area.all.where(id:id)[0][:name]
      if @total_donations.has_key?(name)
        @total_donations[name] += report[:donation]
      else
        @total_donations[name] = report[:donation]
      end
    end
  end
end
