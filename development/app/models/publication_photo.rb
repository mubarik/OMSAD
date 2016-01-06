class PublicationPhoto < ActiveRecord::Base
  belongs_to :publication
  has_attached_file :image,
                          :styles =>
                          {
                            :thumb=> "100x75#",
                            :small  => "300x300>",
                            :large => "600x600>"
                          }

  validates_attachment_content_type :image,
                                    :content_type => ['image/jpeg', 'image/png','image/gif'],
                                    :message => "Invalid image type."
                                  
  validates_attachment_size :image, :less_than => 5.megabytes,
                            :message => "Photo size cannot be more than 5 MB"
end
