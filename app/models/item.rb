class Item < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, :description, :starting_price, :minimum_selling_price, :start_time, :end_time, presence: true
  validates :starting_price, :minimum_selling_price, numericality: { greater_than_or_equal_to: 0 }
  validate :msp_greater_than_starting_price

  private

  def msp_greater_than_starting_price
    if minimum_selling_price.present? && starting_price.present? && minimum_selling_price < starting_price
      errors.add(:minimum_selling_price, "must be greater than or equal to the starting price")
    end
  end
end
