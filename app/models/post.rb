class Post < ApplicationRecord
  belongs_to :customer

  validates :rate, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}, presence: true
  validates :review_title, presence:true, length:{maximum: 30}
  validates :review_body, presence:true
  validates :watched_data, presence:true

  enum way_to_watch: {preview:0,dvd_bd:1,terrestrial_tv:2,cs_bs_cable:3,vod:4,theater:5}
  scope :latest, -> {order(created_at: :desc)}


end
