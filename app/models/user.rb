class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable, :validatable,
         :recoverable, :rememberable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  validates :first_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :last_name, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :email, presence: true, length: { maximum: 50 }

  has_many :reserves, dependent: :destroy
end
