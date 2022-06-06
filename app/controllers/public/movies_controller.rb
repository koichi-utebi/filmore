class Public::MoviesController < ApplicationController
  def index
    response = Movie.now_playing
    @movies = Array.new
    response.each do |m|
      if !m["backdrop_path"].blank?
        @movies << m
      end
    end
  end

  def show
    @movie = Movie.details(params[:id])
  end

  def search
    @search_term = params[:looking_for]
    if @search_term.blank?
      flash[:danger] = "検索キーワードが入力されていません"
      redirect_to root_path
    else
      response = Movie.search(@search_term)
      @total_results = response["total_results"]
      unless @total_results == 0
        @total_pages = response["total_pages"]
        @movie_results = response["results"]
        if @total_pages>1
          @total_pages = @total_pages>30 ? 30 : @total_pages
          (2..@total_pages).each do |page|
            results = Movie.search(@search_term, page)["results"]
            (0...results.count).each do |i|
              @movie_results << results[i]
            end
          end
        end
      end
      # add_movies_to_db @movie_results
      @movie_results = Kaminari.paginate_array(@movie_results).page(params[:page]).per(20) unless @movie_results.blank?
    end
  end
end
