class CreateMsCourses < ActiveRecord::Migration
  def change
    create_table :ms_courses do |t|
      t.integer :student_id
      t.integer :faculty_member_id
      t.integer :student_semester1_id
      t.integer :student_semester2_id
      t.string :coursetype
      t.string :title
      t.date :proposaldefencedate
      t.date :thesisdefencedate
      t.timestamps
    end
  end
end