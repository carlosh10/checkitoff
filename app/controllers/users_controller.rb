class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @item = Item.new
  end


  private
 
   def user_params
     params.require(:user).permit(:name)
   end
end
