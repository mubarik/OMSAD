class CreateLcds < ActiveRecord::Migration
  def change
    create_table :lcds do |t|
      t.string :lcdtype
      t.string :resolution
      t.string :size
      t.integer :inventory_id
      t.timestamps
    end
  end
end
