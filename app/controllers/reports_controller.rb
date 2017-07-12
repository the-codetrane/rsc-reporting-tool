class ReportsController < ApplicationController
  def index
    @groups = Group.all
  end

  def monthly_chart_for_group
    @groups = Group.all
    @groups_for_select = AreaReport.all.map {|r| r.user.group}.uniq.sort_by{|g| g.name}
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
    @valid_months = find_valid_months
    @donations = collect_donations_data_for_all_groups(params[:month].to_i)
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

  def find_valid_months
    area_reports = AreaReport.all
    valid_months = {}
    area_reports.sort_by {|r| r.created_at}.map {|r| r.created_at}.reverse_each do |date|
      month_name = "#{Date::MONTHNAMES[date.month]}"
      valid_months[month_name] = date.month
    end
    valid_months
  end

  def collect_donations_data_for_all_groups(input_month)
    donations = {}
    area_reports = AreaReport.all
    if input_month > Date.today.month
      input_year = Date.today.year - 1
    else
      input_year = Date.today.year
    end
    area_reports.select {|r| r.created_at.month == input_month && r.created_at.year == input_year}.each do |r|
      group = r.user.group.name
      donation = r.donation
      if donations.include?(group)
      donations[group] += donation
      else
        donations[group] = donation
      end
    end
    donations

  end
end
