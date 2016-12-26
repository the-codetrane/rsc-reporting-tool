class MembersController < ApplicationController
  before_action :is_admin?

  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { @user.to_json }
    end
  end

  def edit
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
      format.json { @user.to_json }
    end
  end

  def update
    @user = User.find(params[:id])
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html
        format.js { flash.now.notice = 'Member record updated ' }
        format.json { render json: @user, status: :created, location: @user }
      else
        format.html
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

end