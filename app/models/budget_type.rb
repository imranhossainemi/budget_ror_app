class BudgetType < ApplicationRecord
  belongs_to :author, class_name: 'User'

  validates :name, :icon, presence: true
end
