class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :categories, through: :entities
  default_scope { order(created_at: :desc) }

  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
