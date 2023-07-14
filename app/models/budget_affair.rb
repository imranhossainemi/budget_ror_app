class BudgetAffair < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :budget_types, through: :type_affairs, dependent: :destroy
  has_many :type_affairs, dependent: :destroy

  validates :name, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
  attribute :budget_type_id, :integer
end
