class Reserve < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :date, presence: true
end
