class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.includes(:group, :committee, :role).all.order(:last_name).page(params[:page]).per(10)
    @roles = Role.all
    @groups = Group.all
    @committees = Committee.all
  end

end
