class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :dateofbirth
      t.string :gender
      t.integer :department_id
      t.string :address
      t.string :contactnumber
      t.string :email
      t.timestamps
    end
  end
end
