class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :typename
      t.text :description
      t.timestamps
    end
  end
end
