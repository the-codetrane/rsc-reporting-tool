class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @users = User.includes(:group, :committee, :role).all
  end

  def show
    @user = User.find(params[:id])
  end

end
