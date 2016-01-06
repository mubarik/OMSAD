class ModifyUsers < ActiveRecord::Migration
  def up
    change_column :users , :dateofbirth, :date
  end

  def down
    change_column :users , :dateofbirth, :datetime
  end
end
