class Bid < ApplicationRecord
  belongs_to :user
  belongs_to :item

  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :maximum_bid, numericality: { greater_than: :amount }, allow_nil: true
end
