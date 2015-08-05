class WelcomeController < ApplicationController
  def index
    redirect_to current_user.list if current_user 
  end

  def about
  end
end