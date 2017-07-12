class ReportsController < ApplicationController
  def index
    @groups = Group.all
    @blank = {}
  end

  def create

  end

def monthly_chart_for_group
  @groups = Group.all
  @donations = group_donations_per_month(params[:group_id].to_i)
  respond_to do |format|
    format.html
    format.js
  end
end

def monthly_chart_for_all_groups
  @groups = Group.all
  respond_to do |format|
    format.html
    format.js
  end
end

  def show

  end

  def update
    @group_id = params[:group_id].to_i
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

  def donations(date_range)
  end
end
