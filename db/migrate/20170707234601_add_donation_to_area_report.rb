class AddDonationToAreaReport < ActiveRecord::Migration[5.0]
  def change
    add_column :area_reports, :donation, :decimal
  end
end
