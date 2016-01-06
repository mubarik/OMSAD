class CreateFacultyMemberAwardsInformations < ActiveRecord::Migration
  def change
    create_table :faculty_member_awards_informations do |t|
      t.integer :faculty_member_id
      t.string :title
      t.string :year

      t.timestamps
    end
  end
end
