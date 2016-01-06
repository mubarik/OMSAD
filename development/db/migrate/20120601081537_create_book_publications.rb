class CreateBookPublications < ActiveRecord::Migration
  def change
    create_table :book_publications do |t|
      t.integer :publication_id
      t.string :publishername
      t.string :bookname
      t.timestamps
    end
  end
end
