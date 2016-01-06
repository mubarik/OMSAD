class ModifyLocationOwnerships < ActiveRecord::Migration
  def up
    add_column  :location_ownerships , :location_id , :integer
    change_column :location_ownerships ,:startdate,:date
    change_column :location_ownerships ,:enddate,:date
  end

  def down
    change_column :location_ownerships ,:startdate,:datetime
    change_column :location_ownerships ,:enddate,:datetime
  end
end
