class AddUserIdToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_reference :incidents, :user, null: false, foreign_key: true
  end
end
