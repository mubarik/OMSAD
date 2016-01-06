class Inventory::ScannersController < ApplicationController
  def index
    @scanners = Scanner.all
  end

  def show
  end

  def new

  end

  def edit

  end

  def create
    #scanner = Scanner.create_scanner(params[:scannertype],params[:resolution],params[:scansize],params[:fileformate], params[:inventory_id])
    scanner = Scanner.create_scanner('c_scannertype','c_resolution','c_scansize','c_fileformate',params[:id])
    redirect_to :action => "index"
  end

  def update
    #scanner = Scanner.create_scanner(params[:scannertype],params[:resolution],params[:scansize],params[:fileformate], params[:inventory_id])
    scanner = Scanner.update_scanner('u_scannertype','u_resolution','u_scansize','u_fileformate',1)
  end

  def destroy
    Scanner.delete_scanner(1)
  end
end

