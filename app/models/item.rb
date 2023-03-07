class Item < ApplicationRecord
  has_many :reserves, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :item_model, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :serial_n, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :image, presence: true
  validates :description, presence: true, format: { with: /\A[a-zA-Z0-9]+\z/ }
  validates :brand, presence: true, length: { maximum: 50 }, format: { with: /\A[a-zA-Z0-9]+\z/ }
end
