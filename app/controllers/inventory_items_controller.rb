class InventoryItemsController < ApplicationController
  def index
    @inventory_items = InventoryItem.all
  end

  def new
    @inventory_item = InventoryItem.new
  end

  def show
    @inventory_item = InventoryItem.find(params[:id])
  end

  def edit
    @inventory_item = InventoryItem.find(params[:id])
  end

  def create
    @inventory_item = InventoryItem.new(inventory_item_params)
    if @inventory_item.save
      redirect_to @inventory_item,
        notice: 'Inventory item was successfully created'
    else
      render :new
    end
  end

  def update
    @inventory_item = InventoryItem.new(inventory_item_params)

    if @inventory_item.update(inventory_item_params)
      redirect_to inventory_item_path(@inventory_item), notice: 'Inventory item was successfully updated!'
    else
      render action: 'edit'
    end
  end

  def destroy
    InventoryItem.find(params[:id]).destroy
    redirect_to inventory_item_path, notice: 'Inventory item was succesfully destroyed'
  end

  private

  def inventory_item_params
    params.require(:inventory_item).permit(:title, :description, :quantity)
  end
end
