module ReportsHelper
  def sub_committee_select
    selections = []
    SubCommittee.all.order(:name).each do |committee|
      selections << [committee.name, committee.id]
    end
    selections
  end

  def area_select
    selections = []
    Area.all.order(:name).each do |area|
      selections << [area.name, area.id]
    end
    selections
  end

  def report_signature(user)
    "Submitted by #{user.na_name} from #{user.group.name}"
  end

end
