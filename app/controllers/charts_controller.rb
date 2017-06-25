class ChartsController < ApplicationController
  def index
    @month = Date.today.month
    @reports = AreaReport.all
    create_report_chart
  end

  def refresh
    @month = params[:date][:month].to_i
    if params[:date][:month].to_i > Date.today.month
      year = Date.today.year - 1
    else
      year = Date.today.year
    end
    date = Date.new(year,params[:date][:month].to_i)
    @reports = AreaReport.where('created_at BETWEEN ? AND ?', date, date + 30)
    create_report_chart
    render :index
  end

  private

  def create_report_chart
    @donations = {}
    @reports.sort_by {|r| r.area.name}.each do |report|
        @donations.has_key?(report.area.name) ? @donations[report.area.name] += report.donation : @donations[report.area.name] = report.donation
    end
  end
end
