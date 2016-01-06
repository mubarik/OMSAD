class CreateScanners < ActiveRecord::Migration
  def change
    create_table :scanners do |t|
      t.string :scannertype
      t.string :resolution
      t.string :scansize
      t.string :fileformate
      t.integer :inventory_id
      t.timestamps
    end
  end
end
