class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :user_id
      t.integer :department_id
      t.string :rollno
      t.integer :credithrstaken
      t.string :financialaidstatus
      t.float :cgpa
      t.string :degreelevel
      t.string :probationstatus
      t.string :degreetype
      t.string :degreestatus
      t.integer :currentsemester
      t.date :admissiondate
      t.date :graduationdate
      t.timestamps
    end
  end
end
