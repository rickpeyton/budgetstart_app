class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(email: params[:email])
    if @user.valid? && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:success] = 'Your are logged in.'
      redirect_to user_path(@user)
    else
      flash[:error] = 'Oops. That is not right'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
