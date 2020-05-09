class CreateIncidents < ActiveRecord::Migration[6.0]
  def change
    create_table :incidents do |t|
      t.string  :address
      t.text    :description
      t.integer :age,       null: false
      t.integer :gender,    null: false
      t.integer :status,    null: false
      t.float   :latitude,  null: false
      t.float   :longitude, null: false
      t.boolean :confirmed, null: false

      t.timestamps
    end
  end
end
