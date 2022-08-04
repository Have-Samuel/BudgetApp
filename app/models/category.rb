class Category < ApplicationRecord
  belongs_to :user

  validates :name, :icon, presence: true
end