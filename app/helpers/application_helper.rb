module ApplicationHelper

  def bootstrap_class_for(flash_type)
    case flash_type
      when 'success' || :success
        "alert-success"
      when 'error' || :error
        "alert-warning"
      when 'alert' || :alert
        "alert-danger"
      when 'notice' || :notice
        "alert-info"
      else
        flash_type.to_s
    end
  end

  def group_select
    selections = []
    Group.all.order(:name).each do |group|
      selections << [group.name, group.id]
    end
    selections
  end

end
