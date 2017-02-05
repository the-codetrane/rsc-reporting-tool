class AreaReportsController < ApplicationController
  def index
    @area_reports = AreaReport.includes(:area, :user).order(updated_at: :desc).all
    @users = User.all
    respond_to do |format|
      format.html
      format.json {@area_reports.to_json}
    end
  end

  def show
    @area_report = AreaReport.find(params[:id])
  end

  def new
    @area_report = AreaReport.new
  end

  def create
    @area_report = AreaReport.create(report_params)

    if @area_report.save
      flash[:success] = 'Your Report Has Been Submitted'
      redirect_to reports_path
    else
      flash[:alert] = 'Record did not save'
      redirect_to new_report_path
    end
  end

  def edit
    @area_report = AreaReport.find(params[:id])
  end

  def update
    @area_report = AreaReport.find(params[:id])

    if @area_report.update(report_params)
      flash[:success] = 'Your Report Has Been Updated'
      redirect_to reports_path
    else
      flash[:alert] = 'Something went wrong. Please try again'
      redirect_to new_report_path
    end
  end

  def destroy
    AreaReport.find(params[id]).destroy
  end

  def send_report_email
    report = AreaReport.find(params[:id])
    ReportsMailer.area_report_email(report.area).deliver_later
    flash[:success]= 'Report successfully emailed'
    redirect_to :back
  end

  private

  def report_params
    params.require(:report).permit!
  end
end
