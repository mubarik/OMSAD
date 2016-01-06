class CreateInventoryfiles < ActiveRecord::Migration
  def change
    create_table :inventoryfiles do |t|
       t.string :inventory_type
       t.string :inventory_id
       t.string :barcode
       t.string :inventory_status
       t.string :brand
       t.string :model
       t.string :department
       t.string :sn
       t.string :grn
#Processror Attributes start from here
       t.string :ram
       t.string :rom
       t.string :processor
       t.string :cores
       t.string :threads
       t.string :memory
       t.string :harddisk
       t.string :dvdrom
       t.string :cdrom
       t.string :keyboard
       t.string :mouse
       t.string :soundcard
       t.string :vga
#Printer attributes start from here
       t.string :speed
       t.string :mediatype
       t.string :technology
#Scanner attributes
       t.string :resolution
       t.string :scansize
       t.string :fileformat
       t.string :scannertype
#lcd attributes
       t.string :lcdtype
       t.string :screensize
      t.timestamps
    end
  end
end
