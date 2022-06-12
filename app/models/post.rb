class Post < ApplicationRecord
  belongs_to :customer
  has_many :favorites

  validates :rate, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}, presence: true
  validates :review_title, presence:true, length:{maximum: 100}
  validates :review_body, presence:true
  validates :watched_data, presence:true

  enum way_to_watch: {preview:0,dvd_bd:1,terrestrial_tv:2,cs_bs_cable:3,vod:4,theater:5}
  scope :latest, -> {order(created_at: :desc)}

  def favorited_by?(customer)
    favorites.exists?(customer_id: customer.id)
  end
end
