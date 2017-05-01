module DeviseHelper
  def devise_committee_select
    selections = []
    SubCommittee.all.order(:name).each do |committee|
      selections << [committee.name, committee.id]
    end
    selections
  end
end