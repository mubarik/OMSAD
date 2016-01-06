class CreateUserUserTypes < ActiveRecord::Migration
  def change
    create_table :user_user_types do |t|
      t.integer :user_id
      t.integer :user_type_id
      t.timestamps
    end
  end
end
