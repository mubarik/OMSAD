class ModifyBookPublications < ActiveRecord::Migration
  def up
      remove_column :book_publications , :bookname
  end

  def down
      add_column  :book_publications ,:bookname ,:string
  end
end
