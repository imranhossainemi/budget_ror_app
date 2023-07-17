class BudgetType < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :type_affairs, dependent: :destroy
  has_many :budget_affairs, through: :type_affairs, dependent: :destroy
  validates :name, :icon, presence: true
end
