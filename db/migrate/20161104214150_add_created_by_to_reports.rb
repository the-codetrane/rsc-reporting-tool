class AddCreatedByToReports < ActiveRecord::Migration[5.0]
  def change
    change_table :reports do |t|
      t.string :created_by
    end
  end
end
