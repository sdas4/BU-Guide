class UsersController < ApplicationController
  def new
  end
  
  def index
    @users = User.all
  end
  
  def create
    @user = User.create(params.require(:user).permit(:username, :password, :emailID))
    if !@user.valid?
      flash[:warning] = "Invalid Registration."
    else
      flash[:notice] = "User Successfully Registered"
    end
    redirect_to guide_index_path
  end
end
