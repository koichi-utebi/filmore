class Movie < ApplicationRecord

  has_many :watched_lists
  has_many :posts


  include HTTParty

  default_params api_key: ENV['API_KEY'], language: 'ja-JP'
  format :json

  def self.search (term, page=1)
    base_uri 'https://api.themoviedb.org/3/search/movie'
    get("", query: { query: term, page: page, language: 'ja-JP' })
  end

  def self.discover (year='', genre='', page=1)
    base_uri 'https://api.themoviedb.org/3/discover/movie'
    get("", query: { page: page, language: 'ja-JP', year: year, with_genres: genre })
  end

  def self.details id
    base_uri "https://api.themoviedb.org/3/movie/#{id}"
    get("", query: { language: 'ja-JP', append_to_response: 'credits' } )
  end


  def self.collection id
    base_uri "https://api.themoviedb.org/3/collection/#{id}"
    get("", query: { language: 'ja-JP' })
  end

  def self.now_playing(page=1)
    base_uri 'https://api.themoviedb.org/3/movie/now_playing'
    get("", query: { page: page, language: 'ja-JP', region: "JP" })["results"]
  end

  def self.genre_list (id, page=1)
    base_uri 'https://api.themoviedb.org/3/discover/movie'
    get("", query: { page: page, language: 'ja-JP', region: "JP", with_genres: id })
  end

  def self.year_list (year, page=1)
    base_uri 'https://api.themoviedb.org/3/discover/movie'
    get("", query: { page: page, language: 'ja-JP', primary_release_year: year })
  end

end
