module ReportsHelper
  def committee_select
    selections = []
    Committee.all.order(:name).each do |committee|
      selections << [committee.name, committee.name]
    end
    selections
  end

  def report_signature(user)
    "Submitted by #{user.first_name} from #{user.group.name}"
  end
end
