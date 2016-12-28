class GroupsController < ApplicationController
  before_action :is_admin?

  def index
    @group_select= Group.selector

    @groups = Group.all.order(:name).page(params[:page]).per(10)
  end

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    respond_to do |format|
      if @group.update_attributes(group_params)
        format.html
        format.js { flash.now.notice = 'Group record updated ' }
      else
        format.html {flash[:alert]= 'Something went wrong. Please contact administrator'; redirect_to :back}
        format.js
      end
    end
  end

  private

  def group_params
    params.require(:group).permit!
  end
end
