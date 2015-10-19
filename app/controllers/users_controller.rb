class UsersController < ApplicationController
  def index
 	@user= User.find(params[:id])
  end
  def new
    @user= User.new
  end
  def create
  	binding.pry
    @user = User.create( user_params )
  end
end
private 
def user_params
  params.require(:user).permit(:avatar)
end