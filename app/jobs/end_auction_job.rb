class EndAuctionJob < ApplicationJob
  queue_as :default

  def perform(item_id)
    item = Item.find(item_id)
    return if item.end_time > Time.current

    highest_bid = item.bids.order(amount: :desc).first
    if highest_bid && highest_bid.amount >= item.minimum_selling_price
      item.update(winner_id: highest_bid.user_id)
    end
  end
end
