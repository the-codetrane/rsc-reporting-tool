class GroupsController < ApplicationController
  before_action :is_admin?

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @user = Group.find(params[:id])
    respond_to do |format|
      if @group.update_attributes(group_params)
        format.html
        format.js { flash.now.notice = 'Group record updated ' }
        format.json { render json: @group, status: :created, location: @group }
      else
        format.html
        format.json { render json: @group.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def group_params
    params.require(:group).permit!
  end
end
