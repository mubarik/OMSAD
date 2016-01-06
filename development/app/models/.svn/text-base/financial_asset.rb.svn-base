class FinancialAsset < ActiveRecord::Base
  belongs_to :financial_aid
  has_attached_file :asset

   validates_attachment_content_type :asset, :content_type => ['image/jpeg', 'image/png', 'application/vnd.ms-excel', 'application/pdf', 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'], :message => "is not an acceptable
image file"
   validates_attachment_size :asset, :less_than => 5.megabytes
end
