module ReportsHelper
  def committee_select
    selections = []
    Committee.all.order(:name).each do |committee|
      selections << [committee.name, committee.id]
    end
    selections
  end

  def report_signature(user)
    "Submitted by #{user.na_name} from #{user.group.name}"
  end

end
