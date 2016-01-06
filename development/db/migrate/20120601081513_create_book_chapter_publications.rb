class CreateBookChapterPublications < ActiveRecord::Migration
  def change
    create_table :book_chapter_publications do |t|
      t.integer :publication_id
      t.string :bookname
      t.string :chaptername
      t.string :publishername
      t.text   :editors
      t.timestamps
    end
  end
end