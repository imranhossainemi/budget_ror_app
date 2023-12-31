class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :budget_types, foreign_key: 'author_id', dependent: :destroy
  has_many :budget_affairs, foreign_key: 'author_id', dependent: :destroy
  validates :email, presence: true
  validates :name, presence: true
end
