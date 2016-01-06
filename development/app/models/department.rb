class Department < ActiveRecord::Base
  belongs_to :school
  has_many :users
  has_many :technical_report_publications

end
