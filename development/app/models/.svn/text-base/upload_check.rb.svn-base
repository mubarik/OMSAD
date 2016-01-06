class UploadCheck < ActiveRecord::Base
   has_attached_file :uploadfile

  validates_attachment_content_type :uploadfile,
                                    :content_type => 'text/csv'
end
