class Scanner < ActiveRecord::Base
  has_one :inventory

  validates :scannertype, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :scannertype, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :resolution, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :resolution, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :scansize, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :scansize, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :fileformate, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :fileformate, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'


    def self.create_scanner(inventory_id,scannertype,resolution,scansize,fileformate)
      scanner = Scanner.create(:inventory_id  => inventory_id,
                               :scannertype   => scannertype,
                               :resolution    => resolution,
                               :scansize      => scansize,
                               :fileformate   => fileformate
                               )
      return scanner
    end

    def self.update_scanner(id,scannertype,resolution,scansize,fileformate)
      scanner = Scanner.find_by_id(id)
      scanner.update_attributes(:scannertype    => scannertype,
                                 :resolution    => resolution,
                                 :scansize      => scansize,
                                 :fileformate   => fileformate
                               )
    end
=begin --commented as this is now being done automatically through associations
    def self.delete_scanner(id)
      scanner = Scanner.find_by_id(id)
      scanner.destroy
    end
=end
end
