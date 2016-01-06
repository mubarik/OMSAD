class CreateUserPublications < ActiveRecord::Migration
  def change
    create_table :user_publications do |t|

      t.integer :user_id
      t.integer :publication_id
      t.string :authorname
      t.integer :authorindex
      t.boolean :lumsaffiliation
      t.string :affiliation
      t.timestamps
 
    end
  end
end
