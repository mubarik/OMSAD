class Inventory::LcdsController < ApplicationController
  def index
    @lcds = Lcd.all
  end

  def new
    lcd = Lcd.create_lcd( params[:id],'c_type','c_resolution','c_size')
    flash[:notice] = "Row added successfully"
    redirect_to :action => "index"
  end

  def edit
    lcd = Lcd.update_lcd(params[:id],'u_type','u_resolution','u_size', 1)
    flash[:notice] = "Row updated successfully"
    redirect_to :action => "index"
  end

  def delete
  end

  def destroy
    Lcd.delete_lcd(params[:id])
    flash[:notice] = "Row deleted successfully"
    redirect_to :action => "index"
  end
end

