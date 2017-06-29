class UsersController < ApplicationController

  def index
    @users = User.all
  end
  
  def create
    @user = User.new(user_params)
	@user.save
	redirect_to @user
  end
  
  def new
    
  end
  
  def show
    @user = User.find(params[:id])
	@articles = @user.articles
  end

  private
    def user_params
	  params.require(:user).permit(:fname, :lname, :patronymic, :phone)
	end
end
