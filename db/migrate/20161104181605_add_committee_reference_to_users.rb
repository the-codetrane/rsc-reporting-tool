class AddCommitteeReferenceToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :committee, foreign_key: true
  end
end
