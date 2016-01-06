class Printer < ActiveRecord::Base
  has_one :inventory

  validates :technology, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :technology, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :speed, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :speed, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :memory, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :memory, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :mediatype, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :mediatype, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'


  def self.create_printer(inventory_id,technology,speed,memory,mediatype)
      printer = Printer.create(:inventory_id => inventory_id,:technology => technology, :speed => speed, :memory => memory, :mediatype => mediatype)
      return printer
    end

   def self.update_printer(id, technology,speed, memory, mediatype)
     printer = Printer.find_by_id(id)
     printer.update_attributes(:technology => technology,:speed => speed, :memory => memory, :mediatype => mediatype)
    end

=begin --commented as this is now being done automatically through associations
    def self.delete_printer(id)
      printer = Printer.find_by_id(id)
      printer.destroy
    end
=end
end


