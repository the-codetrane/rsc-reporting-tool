class AdminController < ApplicationController
  def index
    @users = User.includes(:group, :committee, :role).all
  end

  def show
    @user = User.find(params[:id])
  end

end
