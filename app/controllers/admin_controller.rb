class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.includes(:group, :committee, :role).all.order(:last_name).page(params[:member_page]).per(10)
    @roles = Role.all
    @groups = Group.all.order(:name).page(params[:group_page]).per(10)
    @committees = Committee.all

    respond_to do |format|
      format.html
      format.js
    end
  end

end
