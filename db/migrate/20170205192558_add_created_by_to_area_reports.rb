class AddCreatedByToAreaReports < ActiveRecord::Migration[5.0]
  def change
    add_column :area_reports, :created_by, :string
  end
end
