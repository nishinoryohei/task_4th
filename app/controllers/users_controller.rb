class UsersController < ApplicationController
  before_action :set_user,only: [:show,:edit,:update,:favorites,:follows,:followers]
  before_action :correct_user ,only:[:edit,:update]
  def index
  	@user = User.all
  end
  def show
  end
  def edit
  end
  def update
  	if @user.update(user_params)
  		redirect_to user_path(@user.id)
  	else
  		render :edit
  	end
  end
  def favorites
  end
  def follows
  end
  def followers
  end
  private
  def set_user
  	@user = User.find(params[:id])
  end
  def user_params
  	params.require(:user).permit(:name,:body,:image)
  end
  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
        redirect_to root_path
      end
    end
end
