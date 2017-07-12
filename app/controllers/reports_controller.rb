class ReportsController < ApplicationController
  def index

  end

  def monthly_group_donations
    @groups = Group.all
    @group_id = @groups.sample.id

    @donations = group_donations_per_month(@group_id)
  end

  def monthly_donations_by_all_groups

  end

  private

  def group_donations_per_month(group_id)
    donations_by_month = {}
    area_reports = AreaReport.all
    area_reports.select {|report| report.user.group_id == group_id}.sort_by {|report| report.created_at}.each do |report|
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
