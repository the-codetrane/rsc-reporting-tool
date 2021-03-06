class ReportsController < ApplicationController
  def index
    @reports = Report.includes(:committee, :user).order(updated_at: :desc).all
    @users = User.all
    @committees = SubCommittee.all
    respond_to do |format|
      format.html
      format.json {@reports.to_json}
    end
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(report_params)

    if @report.save
      flash[:success] = 'Your Report Has Been Submitted'
      redirect_to reports_path
    else
      flash[:alert] = 'Record did not save'
      redirect_to new_report_path
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def update
    @report = Report.find(params[:id])
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
    Report.find(params[id]).destroy
  end

  def send_committee_report_email
    report = SubCommitteeReport.find(params[:id])
    ReportsMailer.report_email(report.committee).deliver_later
    flash[:success]= 'Report successfully emailed'
    redirect_to :back
  end

  private

  def report_params
    params.require(:report).permit!
  end

end
