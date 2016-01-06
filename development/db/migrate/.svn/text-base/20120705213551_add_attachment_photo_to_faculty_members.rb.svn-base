class AddAttachmentPhotoToFacultyMembers < ActiveRecord::Migration
  def self.up
    change_table :faculty_members do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :faculty_members, :photo
  end
end
