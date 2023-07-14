class TypeAffair < ApplicationRecord
  belongs_to :budget_type, class_name: 'BudgetType'
  belongs_to :budget_affair, class_name: 'BudgetAffair'
end
