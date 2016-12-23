class GroupsController < ApplicationController
  before_action :is_admin?

  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end
end
