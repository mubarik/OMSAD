class CreateInventoryOwnershipHists < ActiveRecord::Migration
  def change
    create_table :inventory_ownership_hists do |t|
      t.integer :inventory_id
      t.integer :user_id
      t.date :startdate
      t.date :enddate
      t.timestamps
    
    end
  end
end
