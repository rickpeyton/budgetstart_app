class UsersController < ApplicationController
  def show; end
  def new
    @user = User.new
  end
  def edit; end
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'Your account has been created'
      redirect_to user_path(@user)
    else
      render :new
    end
  end
  def update; end

  private

    def user_params
      params.require(:user).permit(:email, :password)
    end
end
