class DropExternalUserTable < ActiveRecord::Migration
  def up
      drop_table :external_users
 
  end

  def down
    
  end
end
