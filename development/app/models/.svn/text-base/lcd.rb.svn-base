class Lcd < ActiveRecord::Base
  has_one :inventory

  validates :lcdtype, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :lcdtype, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :resolution, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :resolution, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'
  
  validates :size, :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :size, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'


  def self.create_lcd(inventory_id,type,resolution,size)
      lcd = Lcd.create(:inventory_id  => inventory_id,
                       :lcdtype          => type,
                       :resolution    => resolution,
                       :size          => size
                       )
      return lcd
    end

    def self.update_lcd(id,type,resolution,size)
      lcd = Lcd.find_by_id(id)
      lcd.update_attributes(      :lcdtype          => type,
                                  :resolution    => resolution,
                                  :size          => size
                           )
    end

=begin  --commented as this now being done automatically through associations
    def self.delete_lcd(id)
      lcd = Lcd.find_by_id(id)
      lcd.destroy
    end
=end

end
