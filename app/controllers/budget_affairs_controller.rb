class BudgetAffairsController < ApplicationController
  def new
    @affair = BudgetAffair.new
  end

  def create
    @affair = BudgetAffair.new(budget_affair_params)
    @affair.author_id = current_user.id

    if @affair.save
      TypeAffair.create(budget_affair: @affair, budget_type_id: params[:budget_affair][:budget_type_id])
      flash[:success] = 'New Payment Affair successfully added'
      redirect_to budget_type_path(params[:budget_affair][:budget_type_id])
    else
      flash[:error] = 'Error: new payment affair could not be added'
      render :new
    end
  end

  private

  def budget_affair_params
    params.require(:budget_affair).permit(:name, :amount, :budget_type_id)
  end
end
