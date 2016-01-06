class CreateInventoryOwnerships < ActiveRecord::Migration
  def change
    create_table :inventory_ownerships do |t|
      t.integer :inventory_id
      t.integer :user_id
      t.integer :external_user_id
      t.date :startdate
      t.date :enddate
      t.timestamps
    end
  end
end
