class BidsChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "bid_#{params[:item_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
