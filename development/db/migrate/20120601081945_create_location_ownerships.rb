class CreateLocationOwnerships < ActiveRecord::Migration
  def change
    create_table :location_ownerships do |t|
      t.integer :user_id
      t.datetime :startdate
      t.datetime :enddate
      t.timestamps
    end
  end
end
