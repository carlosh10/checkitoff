class ListsController < ApplicationController

  
  def show
    @list = List.find params[:id]
  end

  private

  def item_params
    params.require(:list).permit(:title)
  end

end
