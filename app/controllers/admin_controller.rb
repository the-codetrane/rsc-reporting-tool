class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @roles = Role.selector
    @committees = SubCommittee.selector
    @group_select= Group.selector

    @users = User.all.order(:last_name).page(params[:member_page]).per(10)
    @groups = Group.all.order(:name).page(params[:group_page]).per(10)

    respond_to do |format|
      format.html
      format.js
    end
  end

  def send_rsc_report_email
    ReportsMailer.create_rsc_email.deliver_later
    flash[:success]= 'Report successfully emailed'
    redirect_to :back
  end

  private

  def is_admin?
    if @logged_in.role.name == 'Admin'
    else
      flash[:alert]= 'You are not authorized to view this page'
      redirect_to root_path
    end
  end

end
