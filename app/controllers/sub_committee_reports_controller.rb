class SubCommitteeReportsController < ApplicationController
  def index
    @sub_committee_reports = SubCommitteeReport.includes(:committee, :user).order(updated_at: :desc).all
    @users = User.all
    @committees = Committee.all
    respond_to do |format|
      format.html
      format.json {@sub_committee_reports.to_json}
    end
  end

  def show
    @sub_committee_report = SubCommitteeReport.find(params[:id])
  end

  def new
    @sub_committee_report = SubCommitteeReport.new
  end

  def create
    @sub_committee_report = SubCommitteeReport.new(sub_committee_report_params)

    if @sub_committee_report.save
      flash[:success] = 'Your Report Has Been Submitted'
      redirect_to reports_path
    else
      flash[:alert] = 'Record did not save'
      redirect_to new_report_path
    end
  end

  def edit
    @sub_committee_report = SubCommitteeReport.find(params[:id])
  end

  def update
    @sub_committee_report = SubCommitteeReport.find(params[:id])
    @sub_committee_report.update(sub_committee_report_params)

    if @sub_committee_report
      flash[:success] = 'Your Report Has Been Updated'
      redirect_to reports_path
    else
      flash[:alert] = 'Something went wrong. Please try again'
      redirect_to new_report_path
    end
  end

  def destroy
    SubCommitteeReport.find(params[id]).destroy
    flash[:alert]= 'Report has been deleted.'
    redirect_to sub_committee_reports_path
  end

  def send_report_email
    report = SubCommitteeReport.find(params[:id])
    ReportsMailer.sub_committee_report_email(report.committee).deliver_later
    flash[:success]= 'Sub-Committee Report successfully emailed'
    redirect_to :back
  end

  private

  def sub_committee_report_params
    params.require(:sub_committee_report).permit!
  end
end
