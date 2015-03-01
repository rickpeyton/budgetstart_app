class ExpensesController < ApplicationController
  before_action :set_user, only: [:new, :edit, :create, :update, :destroy]
  before_action :require_user, only: [:new, :create, :destroy]
  before_action :set_expense, only: [:edit, :update, :destroy]

  def new
    @expense = Expense.new
  end

  def edit
  end

  def create
    @expense = @user.expenses.new(expense_params)
    if @expense.save
      flash[:success] = 'New Expense Created'
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def update
    if @expense.update(expense_params)
      flash[:success] = 'Expense Successfully Updated'
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    if @user.expenses.destroy(@expense)
      flash[:success] = 'Expense Deleted'
      redirect_to user_path(@user)
    else
      flash[:error] = 'Something went wrong'
      redirect_to user_path(@user)
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount, :frequency_id,
                                   :category_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def require_user
    access_denied
  end

  def set_expense
    @expense = Expense.find(params[:id])
  end

end
