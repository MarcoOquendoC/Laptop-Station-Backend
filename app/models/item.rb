class Item < ApplicationRecord
  has_many :reserves, dependent: :destroy

  validates :title, presence: true, length: { maximum: 50 }
  validates :item_model, presence: true, length: { maximum: 50 }
  validates :serial_n, presence: true, length: { maximum: 50 }
  validates :image, presence: true
  validates :description, presence: true
  validates :brand, presence: true, length: { maximum: 50 }
end
