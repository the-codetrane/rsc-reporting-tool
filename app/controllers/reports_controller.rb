class ReportsController < ApplicationController
  def index
    @group_id = 59
    @groups = Group.all
    @donations = group_donations_per_month(@group_id)
  end

  private

  def group_donations_per_month(group_id)
    donations_by_month = {}
    area_reports = AreaReport.all.select {|report| report.user.group_id == group_id}.sort_by {|report| report.created_at}
    area_reports.each do |report|
      month = report.created_at.strftime("%B '%y")
      donation = report.donation
      if donations_by_month.include?(month)
        donations_by_month[month] += donation
      else
        donations_by_month[month] = donation
      end
    end
    donations_by_month
  end


end
