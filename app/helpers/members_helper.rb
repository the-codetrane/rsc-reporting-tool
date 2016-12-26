module MembersHelper

  def members_group_select
    Group.all.order(:name).pluck(:id, :name).to_h
  end

  def members_committee_select
    Committee.all.order(:name).pluck(:id, :name).to_h
  end

  def members_roles_helper
    Role.all.order(:name).pluck(:id, :name).to_h
  end

end