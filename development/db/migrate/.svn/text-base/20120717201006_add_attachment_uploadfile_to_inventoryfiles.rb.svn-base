class AddAttachmentUploadfileToInventoryfiles < ActiveRecord::Migration
  def self.up
    change_table :inventoryfiles do |t|
      t.has_attached_file :uploadfile
    end
  end

  def self.down
    drop_attached_file :inventoryfiles, :uploadfile
  end
end
