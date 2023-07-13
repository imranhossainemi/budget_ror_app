class BudgetAffairsController < ApplicationController
  def new 
    @affair = BudgetAffair.new
  end

  def create 
    @affair = BudgetAffair.new(name: budget_affair_params[:name], amount: budget_affair_params[:amount])

    @affair.author_id = current_user.id
    if @affair.save
      TypeAffair.create(budget_affair: @affair, budget_type_id: budget_affair_params[:budget_type_id])
      flash[:success] = 'New Payment Affair succesfully Added'
      redirect_to budget_type_path(budget_affair_params[:budget_type_id])
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
