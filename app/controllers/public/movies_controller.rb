class Public::MoviesController < ApplicationController
  def index
    response = Movie.now_playing                                                #公開中の映画情報を取得
    @movies = Array.new                                                         #配列の初期化
    response.each do |m|
      if !m["backdrop_path"].blank?
        @movies << m                                                            #backdrop_pathが空白だった場合は初期化した配列に公開中の映画の情報を格納
      end
    end
    @genres = Genre.all
  end

  def show
    @movie = Movie.details(params[:id])
    @post = Post.new
    @posts = Post.where(movie_id: @movie['id']).latest.page(params[:page]).per(10)
    @watched_list = WatchedList.new
  end

  def search
    @genres = Genre.all
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
      else
        redirect_to root_path
      end
      @movie_results = Kaminari.paginate_array(@movie_results).page(params[:page]).per(20) unless @movie_results.blank?
    end
  end

 def genre_search
  @genres = Genre.all
  @genre = Genre.find(params[:genre_id])
  @genre_id = @genre.genre_ids
  response = Movie.genre_list(@genre_id)
  @total_pages = response["total_pages"]
  @movie_results = response["results"]

  @total_pages = @total_pages>30 ? 30 : @total_pages
  (2..@total_pages).each do |page|
    results = Movie.discover(@year, @genre_id, page)["results"]
    (0...results.count).each do |i|
      @movie_results << results[i]
    end
  end
  @movie_results = Kaminari.paginate_array(@movie_results).page(params[:page]).per(20) unless @movie_results.blank?
 end

end
