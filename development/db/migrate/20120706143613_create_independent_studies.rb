class CreateIndependentStudies < ActiveRecord::Migration
  def change
    create_table :independent_studies do |t|
      t.integer :student_id
      t.integer :faculty_member_id
      t.integer :student_semester_id
      t.string :studycode
      t.string :studytitle
      t.integer :studycredithrs
      t.string :studygrade
      t.timestamps
    end
  end
end
