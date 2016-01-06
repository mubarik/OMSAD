class CreateFilestudentsemesters < ActiveRecord::Migration
  def change
    create_table :filestudentsemesters do |t|
      t.string :studentid
      t.string :offering
      t.string :year
      t.string :coursecode
      t.string :coursename
      t.string :gpa
      t.string :grade
      t.string :status

      t.timestamps
    end
  end
end
