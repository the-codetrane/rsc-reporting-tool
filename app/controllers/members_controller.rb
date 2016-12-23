class MembersController < ApplicationController
  before_action :is_admin?

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end
end
