module AdminHelper
  def roles_helper
    Role.all.pluck(:name, :id)
  end
end
