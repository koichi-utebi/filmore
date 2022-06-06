class Public::HomesController < ApplicationController
  require 'themoviedb-api'
  Tmdb::Api.key(ENV['API_KEY'])
  Tmdb::Api.language("ja")
  def top
  end

  def about
  end
end
