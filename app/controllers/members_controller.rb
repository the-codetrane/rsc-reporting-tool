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
        format.html { redirect_to(@user, notice:'User was successfully updated.') }
        format.json { respond_with_bip(@user) }
      else
        format.html { render action: 'edit' }
        format.json { respond_with_bip(@user) }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit!
  end

end
