class AddArchivedToIncidents < ActiveRecord::Migration[6.0]
  def change
    add_column :incidents, :archived, :boolean, default: false
  end
end
