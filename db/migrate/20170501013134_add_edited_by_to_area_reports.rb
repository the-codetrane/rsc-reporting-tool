class AddEditedByToAreaReports < ActiveRecord::Migration[5.0]
  def change
    add_column :area_reports, :edited_by, :string, default: 'N.A.'
  end
end
