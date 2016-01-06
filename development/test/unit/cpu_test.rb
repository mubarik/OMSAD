require 'test_helper'

class CpuTest < ActiveSupport::TestCase
 fixtures :cpus
 def setup
    @cpu = cpus(:cputest)
  end
   test "should not save cpu details if  processor name has special characters" do
    cpuObj = Cpu.new(

     :processorname => "%&^^",
      #"^&^" 

      :numberofcores=> 5,
       #"^&^" 

      :numberofthreads=> 2,
      #"^&^" 

      :cpumemory=> "23GB",
      #nil

      :hard_disk => "120GB",
      #"^&^" 

      :dvdrom=>"HP",
       #"^&^" 

      :cdrom=> "model",
      #"^&^" 

      :keyboard=>"Alpha",
      #&*&9
      
     :mouse => "HPPrinter",
      #"^&^" 

      :sound_card=>"HP",
       #"^&^" 

      :vga=> "model",
      #"^&^" 

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 test "should not save cpu details if  no of cores is not numeric" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> "Fsg",
       #"^&^"

      :numberofthreads=> 2,
      #"^&^"

      :cpumemory=> "23GB",
      #nil

      :hard_disk => "120GB",
      #"^&^"

      :dvdrom=>"HP",
       #"^&^"

      :cdrom=> "model",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HPPrinter",
      #"^&^"

      :sound_card=>"HP",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 test "should not save cpu details if  no of threads is not numeric" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "23GB",
      #nil

      :hard_disk => "120GB",
      #"^&^"

      :dvdrom=>"HP",
       #"^&^"

      :cdrom=> "model",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HPPrinter",
      #"^&^"

      :sound_card=>"HP",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 test "should not save cpu details if cpu memory has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "^&*8",
      #nil

      :hard_disk => "120GB",
      #"^&^"

      :dvdrom=>"HP",
       #"^&^"

      :cdrom=> "model",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HPPrinter",
      #"^&^"

      :sound_card=>"HP",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end

 test "should not save cpu details if hard disk has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "32GB",
      #nil

      :hard_disk => "*(*90",
      #"^&^"

      :dvdrom=>"HP",
       #"^&^"

      :cdrom=> "model",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HPPrinter",
      #"^&^"

      :sound_card=>"HP",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end

 test "should not save cpu details if dvd rom has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "32GB",
      #nil

      :hard_disk => "320GB",
      #"^&^"

      :dvdrom=>"&*(",
       #"^&^"

      :cdrom=> "model",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HPPrinter",
      #"^&^"

      :sound_card=>"HP",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 test "should not save cpu details if cd rom has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "32GB",
      #nil

      :hard_disk => "320GB",
      #"^&^"

      :dvdrom=>"Duplex",
       #"^&^"

      :cdrom=> "8*()",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HPPrinter",
      #"^&^"

      :sound_card=>"HP",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 test "should not save cpu details if keyboard has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "32GB",
      #nil

      :hard_disk => "320GB",
      #"^&^"

      :dvdrom=>"Duplex",
       #"^&^"

      :cdrom=> "HP",
      #"^&^"

      :keyboard=>"&*(",
      #&*&9

     :mouse => "HPPrinter",
      #"^&^"

      :sound_card=>"HP",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 test "should not save cpu details if mouse has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "32GB",
      #nil

      :hard_disk => "320GB",
      #"^&^"

      :dvdrom=>"Duplex",
       #"^&^"

      :cdrom=> "HI",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "&*(&(",
      #"^&^"

      :sound_card=>"HP",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 test "should not save cpu details if sound card has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "32GB",
      #nil

      :hard_disk => "320GB",
      #"^&^"

      :dvdrom=>"Duplex",
       #"^&^"

      :cdrom=> "HI",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HJ",
      #"^&^"

      :sound_card=>"*()",
       #"^&^"

      :vga=> "model",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 test "should not save cpu details if VGA has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "32GB",
      #nil

      :hard_disk => "320GB",
      #"^&^"

      :dvdrom=>"Duplex",
       #"^&^"

      :cdrom=> "HI",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HJ",
      #"^&^"

      :sound_card=>"GH",
       #"^&^"

      :vga=> "&*(&*(",
      #"^&^"

      :ram=>"Alpha"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end

 test "should not save cpu details if RAM has special characters" do
    cpuObj = Cpu.new(

     :processorname => "HGR",
      #"^&^"

      :numberofcores=> 3,
       #"^&^"

      :numberofthreads=> "drdt",
      #"^&^"

      :cpumemory=> "32GB",
      #nil

      :hard_disk => "320GB",
      #"^&^"

      :dvdrom=>"Duplex",
       #"^&^"

      :cdrom=> "HI",
      #"^&^"

      :keyboard=>"Alpha",
      #&*&9

     :mouse => "HJ",
      #"^&^"

      :sound_card=>"GH",
       #"^&^"

      :vga=> "HI",
      #"^&^"

      :ram=>"^*^*&"
      #nil

    )
    assert !cpuObj.save, cpuObj.errors.inspect
  end


 def test_associations
    assert_working_associations
  end
end
