class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :category
  validates :name, presence: true
  validates :amount, presence: true, numericality: { only_integer: true }
end
