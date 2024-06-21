class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items, foreign_key: 'seller_id', dependent: :destroy
  has_many :bids, dependent: :destroy

  enum role: {
    seller: 0,
    buyer: 1
  }
end
