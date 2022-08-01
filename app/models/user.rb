class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :name, presence: true
  has_many :groups, dependent: :destroy
  has_many :entities, dependent: :destroy

  def admin?(_admin)
    :role == 'admin'
  end

  def authenticate(password)
    valid_password?(password)
  end
end
