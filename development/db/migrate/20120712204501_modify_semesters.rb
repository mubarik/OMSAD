class ModifySemesters < ActiveRecord::Migration
  def up
    change_column :semesters , :year, :string
  end

  def down
    change_column :semesters , :year, :integer
  end
end
