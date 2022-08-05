class Category < ApplicationRecord
  belongs_to :user
  has_many :entities

  def total_entities
    entities.sum(:amount)
  end

  validates :name, :icon, presence: true
end
