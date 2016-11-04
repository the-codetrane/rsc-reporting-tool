module DeviseHelper
  def devise_group_select
    selections = []
    Group.all.order(:name).each do |group|
      selections << [group.name, group.id]
    end
    selections
  end

  def devise_committee_select
    selections = []
    Committee.all.order(:name).each do |committee|
      selections << [committee.name, committee.id]
    end
    selections
  end
end