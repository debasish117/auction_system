# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
"3.0.1"

* Installation
1. Clone the repo & run command **bundle install** to install the gems and its dependencies.
2. Run command **rails db:create** after setting up the database.yml file to create respective database.
3. Run **rails db:migrate** to run the migrations.

* Test suite - Test cases have not been added yet as I would need some additional time for doing it and have to submit it as acknowledged.

* Services (job queues, cache servers, search engines, etc.) - Application uses rails job for creating and running the scheduled jobs.

* Development Approach
1. A user would be created having a role while sugnup - which could be either a **Seller** or **Buyer**.
2. Devise gem is used for authentication purpose.
3. Depending upon the role the flow is divided to have two functionalities -
   A. If user is a Seller, it would have the ability to create items for listing.
   B. If user is a Buyer, it would have the ability to see the listed items and bid against it.
4. Buyer while bidding can provide the bid amount & the maximum bid amount. Maximum bid amount will help in case of automatic bidding when a buyer is outbid.
5. To handle the functionality of automatic bidding and with minimum incremented bidding amount, a service is created whose sole purpose is to create bid, update bid when outbid and has increment logic.
6. Also a schedule job is added for handling and figuring out the winner once the bid time is up .

* How to check the functionality
1. Open a tab in browser with user logged in as Seller and create an item for auction.
2. Open two separate instances in browser to log in as two different buyers to bid for the same item.
3. The bid should auto increment for the buyer when outbid and the auction should end when the auction time is over ( via Scheduler ).


