class BudgetAffairsController < ApplicationController
  def new 
    @affair = BudgetAffair.new
  end

  def create 
    @affair = BudgetAffair.new(name: affair_params[:name], amount: affair_params[:amount])
end
