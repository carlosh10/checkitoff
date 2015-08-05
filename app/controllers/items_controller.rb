class ItemsController < ApplicationController
 
  def new
  end

  def create
    @list = current_user.list
    @item = @list.items.build(item_params)
    @item.save!
    redirect_to @list
  end

  def destroy
    @item = Item.find(params[:id])
    @list = @item.list
    if @item.destroy
     flash[:notice] = "Item deleted."
    else
      flash[:error] = "Error deleting the item. Please try again."
    end

    redirect_to @list

  end

  private

  def item_params
    params.require(:item).permit(:name)
  end

end