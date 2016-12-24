class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.includes(:group, :committee, :role).all.order(:last_name).page(params[:member_page]).per(10)
  end

end
