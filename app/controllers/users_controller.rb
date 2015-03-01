class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  before_action :require_user, only: [:show]

  def show
    @category = @user.categories.first
  end

  def new
    if current_user
      redirect_to user_path(current_user)
    end
    @user = User.new
  end

  def edit; end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.getting_started
      flash[:success] = 'Your account has been created!  A few categories and expenses have been added to help get you started.  You can add additional categories and expenses by using the links at the top of the screen. Enjoy!'
      session[:user_id] = @user.id
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

    def set_user
      @user = User.find(params[:id])
    end

    def require_user
      if @user != current_user
        flash[:error] = 'You can not do that.'
        redirect_to root_url
      end
    end
end
