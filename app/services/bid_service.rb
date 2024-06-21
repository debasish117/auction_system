class BidService
  attr_reader :item, :new_bid

  def initialize(item, new_bid)
    @item = item
    @new_bid = new_bid
  end

  def place_bid
    ActiveRecord::Base.transaction do 
      highest_bid = items.bids.order(amount: :desc).first
      if highest_bid && highest_bid.maximum_bid.present? && new_bid.amount <= highest_bid.maximum_bid
        automatic_bid_amount = [new_bid.amount + bid_increment(highest_bid.amount), highest_bid.maximum_bid].min
        highest_bid.update!(amount: automatic_bid_amount)
      else
        new_bid.save!
      end
    end
  end

  private

  def bid_increment(current_amount)
    case current_amount
    when 0..50
      1
    when 51..100
      2
    when 101..500
      5
    when 501..1000
      10
    else
      20
    end
  end
end