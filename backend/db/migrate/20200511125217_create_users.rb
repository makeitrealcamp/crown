class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name            , null: false
      t.string :last_name       , null: true
      t.string :email           , null: false
      t.string :username        , null: false
      t.string :password_digest , null: false
      t.boolean :admin          , default: false
      t.integer :status         , default: false
      t.boolean :validator      , default: false
      t.boolean :organization   , default: false

      t.timestamps
    end
  end
end
