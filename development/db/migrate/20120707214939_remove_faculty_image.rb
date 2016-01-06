class RemoveFacultyImage < ActiveRecord::Migration
  def up
    remove_column :faculty_members, :photo_file_name
    remove_column :faculty_members, :photo_content_type
    remove_column :faculty_members, :photo_file_size
    remove_column :faculty_members, :photo_updated_at
  end

  def down
    add_column :faculty_members, :photo_file_name, :string
    add_column :faculty_members, :photo_content_type, :string
    add_column :faculty_members, :photo_file_size, :integer
    add_column :faculty_members, :photo_updated_at, :datetime
  end
end
