class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
  end

  def edit
    @group = Group.find(params[:id])
  end
end
