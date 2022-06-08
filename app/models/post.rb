class Post < ApplicationRecord
  validates :rate, numericality: {less_than_or_equal_to: 5, greater_than_or_equal_to: 1}, presence: true
  enum way_to_watch: {preview:0,dvd_bd:1,terrestrial_tv:2,cs_bs_cable:3,vod:4,theater:5}
  scope :latest, -> {order(created_at: :desc)}
  belongs_to :customer


  include HTTParty

  default_params api_key: ENV['API_KEY'], language: 'ja-JP'
  format :json

  def self.details id
    base_uri "https://api.themoviedb.org/3/movie/#{id}"
    get("", query: { language: 'ja-JP', append_to_response: 'credits' } )
  end

end
