class ItemsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  before_action :set_item, only: %i[ show edit update destroy ]

  #This class contains the CRUD operations 

  #READ CRUD OPERATIONS
  #R
  def index
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end

  #R
  def show
  end
  
  #R
  def search
    @q = Item.ransack(params[:q])
    @items = @q.result(distinct: true)
  end


  #CREATE CRUD OPERATIONS
  #C
  def new
    @item = Item.new
  end 
  
  #C
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path, notice: "Item was successfully created."
    else
      render :new
    end
  end

  #UPDATE CRUD OPERATIONS
  #U
  def edit
  end

  #U
  def update
    if @item.update(item_params)
      redirect_to @item, notice: "Item was successfully updated."
    else
      render :edit
    end
  end

  # DELETE CRUD OPERATIONS
  #D
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    Rails.logger.debug "Item destroyed: #{@item.name}"
    respond_to do |format|
      format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  
#OTHER
  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :description, :category_id, :size, :colour)
  end
end
