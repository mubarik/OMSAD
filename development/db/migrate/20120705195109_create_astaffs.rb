class CreateAstaffs < ActiveRecord::Migration
  def change
    create_table :astaffs do |t|
      t.integer :user_id
      t.string  :employee_id
      t.string  :description
      t.timestamps
    end
  end
end
