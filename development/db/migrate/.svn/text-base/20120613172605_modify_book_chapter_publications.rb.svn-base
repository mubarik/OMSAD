class ModifyBookChapterPublications < ActiveRecord::Migration
  def up

    # the chapter name would be stored in the title field of the parent table
    remove_column :book_chapter_publications , :chaptername
  end

  def down
    add_column  :book_chapter_publications , :chaptername , :string
  end
end
