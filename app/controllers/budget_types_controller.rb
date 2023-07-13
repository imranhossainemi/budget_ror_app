class BudgetTypesController < ApplicationController
  before_action :authenticate_user!

  def index
    @budget_types = current_user.budget_types
  end

  def show
    @budget_type = BudgetType.find(params[:id])
  end

  def new
    @budget_type = BudgetType.new
  end

  def create
    @budget_type = BudgetType.new(budget_type_params)
    @budget_type.author_id = current_user.id
    if @budget_type.save
      flash[:success] = 'New Budget Type added succesfully'
      redirect_to budget_types_path
    else
      flash[:error] = 'Error: New budget type could not be add'
      render :new
    end
  end

  def destroy
    @budget_type = BudgetType.find(params[:id])
    @budget_type.destroy
    flash[:notice] = 'Budget Type removed succesfully'
    redirect_back(fallback_location: budget_types_path)
  end

  private

  def budget_type_params
    params.require(:budget_type).permit(:name, :icon)
  end
end
