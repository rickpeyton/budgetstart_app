class CategoriesController < ApplicationController
  before_action :set_user, only: [:new, :edit]
  before_action :require_user, only: [:new, :edit]

  def new
    @category = Category.new
  end

  def edit
    if request.patch?
      if @user.update(user_params)
        flash[:success] = 'Categories Updated'
        redirect_to user_path(@user)
      else
        render :edit
      end
    end
  end

  def create
    @user = User.find(params[:user_id])
    @category = @user.categories.new(category_params)
    if @category.save
      flash[:success] = 'New Category Created'
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def user_params
      params.require(:user).permit(categories_attributes: [:id, :name, :_destroy])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    def require_user
      if @user != current_user
        flash[:error] = 'You can not do that.'
        redirect_to root_url
      end
    end
end
