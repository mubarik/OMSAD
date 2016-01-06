class CreateExaminations < ActiveRecord::Migration
  
  def change
    create_table :examinations do |t|
      t.integer :milestone_id
      t.string :examinationname
      t.string :examinationstatus
      t.date :examinationdate

      t.timestamps
    end
  end
end
