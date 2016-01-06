class CreateFacultyMemberDesignationTypes < ActiveRecord::Migration
  def change
    create_table :faculty_member_designation_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
