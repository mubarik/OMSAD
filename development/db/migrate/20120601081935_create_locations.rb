class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :locationname
      t.string :description
      t.integer :room_detail_id
      t.timestamps
    end
  end
end
