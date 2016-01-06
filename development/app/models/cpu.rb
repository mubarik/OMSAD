class Cpu < ActiveRecord::Base
  has_one :inventory

  validates :processorname , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :processorname, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :numberofcores ,:numericality =>{ :message => 'Enter digits only'}, :allow_blank => true

  validates :numberofthreads ,:numericality =>{ :message => 'Enter digits only'}, :allow_blank => true

  validates :cpumemory , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :cpumemory, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :hard_disk , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :hard_disk, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :dvdrom , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :dvdrom, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :cdrom , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :cdrom, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :keyboard , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :keyboard, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :mouse , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :mouse, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :sound_card , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :sound_card, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :vga , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :vga, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'

  validates :ram , :length=>{:maximum => 30,:message=> "Maximum 30 characters are allowed."}
  validates_format_of :ram, :with => /^(?:[^\W_]|\s|[\._-])*$/,:message => 'No special characters allowed'
  


    def self.create_cpu(inventory_id, processorname, numberofcores, numberofthreads, cpumemory, hard_disk, dvdrom,
                        cdrom, keyboard, mouse, sound_card, vga, ram
                       )
      cpu = Cpu.create(
                        :inventory_id     => inventory_id,
                        :processorname    => processorname,
                        :numberofcores    => numberofcores,
                        :numberofthreads  => numberofthreads,
                        :cpumemory        => cpumemory,
                        :hard_disk        => hard_disk,
                        :dvdrom           => dvdrom,
                        :cdrom            => cdrom,
                        :keyboard         => keyboard,
                        :mouse            => mouse,
                        :sound_card       => sound_card,
                        :vga              => vga,
                        :ram              => ram
                      )
      return cpu
    end

    def self.update_cpu(id, processorname, numberofcores, numberofthreads, cpumemory, hard_disk, dvdrom,
                        cdrom, keyboard, mouse, sound_card, vga, ram
                       )
      cpu = Cpu.find_by_id(id)
      cpu.update_attributes(
                        :processorname    => processorname,
                        :numberofcores    => numberofcores,
                        :numberofthreads  => numberofthreads,
                        :cpumemory        => cpumemory,
                        :hard_disk        => hard_disk,
                        :dvdrom           => dvdrom,
                        :cdrom            => cdrom,
                        :keyboard         => keyboard,
                        :mouse            => mouse,
                        :sound_card       => sound_card,
                        :vga              => vga,
                        :ram              => ram
                                 )
    end
=begin --commented as this is now being done automatically through associations
    def self.delete_cpu(id)
      cpu = Cpu.find_by_id(id)
      cpu.destroy
    end
=end
end


