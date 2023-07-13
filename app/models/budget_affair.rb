class BudgetAffair < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many : budget_types, through: :type_affairs, dependent: :destroy
  
  validates :name, presence: true
  validates :amount, numericality: true
end
