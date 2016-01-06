class GradStudentProjectConf < ActiveRecord::Base
  has_many :departments,
           :foreign_key=>"project_conf_id",
           :class_name=>"Department"
   accepts_nested_attributes_for :departments,
    :reject_if=> lambda{|a| a[:name].blank?},
    :allow_destroy => true
end
