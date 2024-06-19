class Item < ApplicationRecord
  belongs_to :user
  has_many :bids, dependent: :destroy

  validates :title, :description, :starting_price, :start_time, :end_time, presence: true
  
end
