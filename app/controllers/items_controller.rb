class ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end

  def show
    set_item()
  end



  private

  def set_item
    @item = Item.find(params[:id])
  end


  def item_params
    params.require(:item).permit(:title, :description, :price, :image_url)
  end



end
