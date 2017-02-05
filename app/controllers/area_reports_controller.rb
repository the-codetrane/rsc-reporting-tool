class AreaReportsController < ApplicationController
  def index
    @reports = AreaReport.includes(:committee, :user).order(updated_at: :desc).all
    @users = User.all
    respond_to do |format|
      format.html
      format.json {@reports.to_json}
    end
  end

  def show
    @report = AreaReport.find(params[:id])
  end

  def new
    @report = AreaReport.new
  end

  def create
    @report = AreaReport.new(report_params)

    if @report.save
      flash[:success] = 'Your Report Has Been Submitted'
      redirect_to reports_path
    else
      flash[:alert] = 'Record did not save'
      redirect_to new_report_path
    end
  end

  def edit
    @report = AreaReport.find(params[:id])
  end

  def update
    @report = AreaReport.find(params[:id])
    @report.update(report_params)

    if @report
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

  def send_committee_report_email
    report = AreaReport.find(params[:id])
    ReportsMailer.report_email(report.committee).deliver_later
    flash[:success]= 'Report successfully emailed'
    redirect_to :back
  end

  def send_rsc_report_email
    ReportsMailer.create_rsc_email.deliver_later
    flash[:success]= 'Area Report successfully emailed'
    redirect_to :back
  end

  private

  def report_params
    params.require(:report).permit!
  end
end
