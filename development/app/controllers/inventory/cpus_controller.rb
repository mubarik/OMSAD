class Inventory::CpusController < ApplicationController
  def index
    @cpus = Cpu.all
  end

  def show
  end

  def new
    cpu = Cpu.create_cpu(params[:inventory_id], 'c_processorname', 'c_numberofcores', 'c_numberofthreads', 'c_cpumemory', 'c_hard_disk', 'c_dvdrom',
                        'c_cdrom', 'c_keyboard', 'c_mouse', 'c_sound_card', 'c_vga', 'c_ram')
    flash[:notice] = "Row added successfully"
    redirect_to :action => "index"
  end

  def edit
    Cpu.update_cpu(params[:id], 'u_processorname', 'u_numberofcores', 'u_numberofthreads', 'u_cpumemory', 'u_hard_disk', 'u_dvdrom',
                        'u_cdrom', 'u_keyboard', 'u_mouse', 'u_sound_card', 'u_vga', 'u_ram')
    flash[:notice] = "Row updated successfully"
    redirect_to :action => "index"
  end

  def create
    #cpu = Cpu.create_cpu(inventory_id, processorname, numberofcores, numberofthreads, cpumemory, hard_disk, dvdrom,
    #                   cdrom, keyboard, mouse, sound_card, vga, ram)

  end
 
  def destroy
    Cpu.delete_cpu(params[:id])
    flash[:notice] = "Row deleted successfully"
    redirect_to :action => "index"
  end
end
