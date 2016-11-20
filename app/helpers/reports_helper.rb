module ReportsHelper
  def committee_select
    selections = []
    @committees.order(:name).each do |committee|
      selections << [committee.name, committee.id]
    end
    selections
  end

  def report_signature(user)
    "Submitted by #{user.na_name} from #{user.group.name}"
  end

  def reports_submitted_by(email)
    user = @users.find_by_email(email)
    "#{user.na_name} from #{user.group.name}"
  end

end
