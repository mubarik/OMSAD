class CreateLocationOwnershipHists < ActiveRecord::Migration
  def change
    create_table :location_ownership_hists do |t|
      t.integer :location_id
      t.integer :user_id
      t.date :startdate
      t.date :enddate
      t.timestamps
    end
  end
end

