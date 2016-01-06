class CreateStudentProbationStatusTypes < ActiveRecord::Migration
  def change
    create_table :student_probation_status_types do |t|
      t.string :name
      t.integer :project_conf_id

      t.timestamps
    end
  end
end
