class Public::MoviesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key(ENV['API_KEY'])
  Tmdb::Api.language("ja")
  def index
    @movies = JSON.parse((Tmdb::Movie.popular).to_json)
    @movie_info = JSON.parse((Tmdb::Discover.movie).to_json)
  end

  def show
  end
end
