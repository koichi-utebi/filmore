class Public::HomesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key(ENV['API_KEY'])
  Tmdb::Api.language("ja")
  def top
    @movies = JSON.parse((Tmdb::Movie.popular).to_json)
  end

  def about
  end
end
