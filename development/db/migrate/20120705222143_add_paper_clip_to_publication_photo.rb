class AddPaperClipToPublicationPhoto < ActiveRecord::Migration
  def change
    add_column :publication_photos, :image_file_name, :string
    add_column :publication_photos, :image_content_type, :string
    add_column :publication_photos, :image_file_size, :integer
  end
end
