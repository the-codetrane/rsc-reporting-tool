class AdminController < ApplicationController
  before_action :is_admin?

  def index
    @roles = Role.selector
    @committees = Committee.selector
    @group_select= Group.selector

    @users = User.all.order(:last_name).page(params[:member_page]).per(10)
    @groups = Group.all.order(:name).page(params[:group_page]).per(10)

    respond_to do |format|
      format.html
      format.js
    end
  end

end
