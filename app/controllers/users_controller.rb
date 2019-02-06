class UsersController < ApplicationController
  
  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end 

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to subs_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
