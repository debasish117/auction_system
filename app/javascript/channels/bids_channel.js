import consumer from "channels/consumer"
document.addEventListener('turbolinks:load', () => {
  debugger;
  const bidsElement = document.getElementById('bids')
  console.log("----", "000")
  if (bidsElement){
    const itemId = bidsElement.dataset.itemId
    consumer.subscriptions.create({ channel: "BidsChannel", item_id: itemId }, {
      connected() {
        // Called when the subscription is ready for use on the server
      },

      disconnected() {
        // Called when the subscription has been terminated by the server
      },

      received(data) {
        debugger;
        // Called when there's incoming data on the websocket for this channel
        const bidsList = document.getElementById('bids-list')
        bidsList.insertAdjacentHTML('beforeend',`<li>${data.bid}</li>`)
      }
    });
  }
});

