class CreateUploadChecks < ActiveRecord::Migration
  def change
    create_table :upload_checks do |t|
      t.string :uploadfile_file_name
      t.string :uploadfile_content_type
      t.string :uploadfile_file_size
      t.datetime :uploadfile_updated_at

      t.timestamps
    end
  end
end
