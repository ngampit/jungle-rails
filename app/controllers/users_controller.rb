class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "Welcome to the site, you have sucessfully sign up "
      session[:user_id] = @user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end

  private 
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :lname)
  end


end
