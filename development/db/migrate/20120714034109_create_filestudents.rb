class CreateFilestudents < ActiveRecord::Migration
  def change
    create_table :filestudents do |t|
      t.string :name
      t.string :dob
      t.string :gender
      t.string :department
      t.string :address
      t.string :contactno
      t.string :email
      t.string :usertype
      t.string :rollno
      t.string :credithrs
      t.string :financialaid
      t.string :cgpa
      t.string :degreelevel
      t.string :probation
      t.string :currentstatus
      t.string :admission


      t.timestamps
    end
  end
end
