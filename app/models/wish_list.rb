class WishList < ApplicationRecord

  belongs_to :customer

  scope :latest, -> {order(created_at: :desc)}
end
