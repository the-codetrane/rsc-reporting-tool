module AreaReportsHelper
  def report_signature(user)
    "Submitted by #{user.na_name} from #{user.group.name}"
  end
end
