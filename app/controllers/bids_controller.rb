class BidsController < ApplicationController
  before_action :authenticate_user!

  def create
    @item = Item.find(params[:item_id])
    @bid = @item.bids.build(bid_params)
    @bid.user = current_user
    BidService.new(@item,@bid).place_bid

    if @bid.save!
      redirect_to @item, notice: 'Your bid was placed successfully.'
    else
      redirect_to @item, alert: 'Failed to place bid.'
    end
  end

  private

  def bid_params
    params.require(:bid).permit(:amount, :maximum_bid)
  end
end