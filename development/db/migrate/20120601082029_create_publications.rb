class CreatePublications < ActiveRecord::Migration
  def change
    create_table :publications do |t|
      t.string :title
      t.text :abstract
      t.string :researcharea
      t.datetime :publicationdate
      t.integer :publicationtype_id
      t.integer :publicationstatustype_id
      t.timestamps
    end
  end
end
