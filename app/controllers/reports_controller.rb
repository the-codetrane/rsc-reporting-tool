class ReportsController < ApplicationController
  def index
    @reports = Report.all
  end

  def show
    @report = Report.find(params[:id])
  end

  def new
    @report = Report.new(report_params)
  end

  def create
    @report = Report.new

    if @report.save
      redirect_to :index
    else
      flash[:alert] = 'record did not save'
      redirect_to :new
    end
  end

  def edit
    @report = Report.find(params[:id])
  end

  def destroy
    Report.find(params[id]).destroy
  end

  private

  def report_params
    params.require(:report).permit!
  end

end
