class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
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
