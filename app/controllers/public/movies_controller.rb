class Public::MoviesController < Public::ApplicationController
   before_action :authenticate_customer!, except: [:index, :show, :search, :genre_search]
  def index
    response = Movie.now_playing#公開中の映画情報を取得
    @movies = Array.new#配列の初期化
    response.each do |m|
      if !m["poster_path"].blank?
        @movies << m  #ポスター画像が存在する場合のみ初期化した配列に映画情報を格納
      end
    end
    @genres = Genre.all
  end

  def show
    @movie = Movie.details(params[:id])#映画詳細情報を取得
    @posts = Post.where(movie_id: @movie['id'], is_active: true).latest.page(params[:page]).per(10)#投稿されたレビューのうち該当の映画に関するレビューのみを取り出す
    @post = Post.new#レビューの新規投稿、パラメーターをposts#newページに渡す
    @watched_list = WatchedList.new#視聴済みリストへの追加、watched_lists#createへparamsを渡す
    @wish_list = WishList.new#ウィッシュリストへの追加、wish_lists#createへparamsを渡す
    if customer_signed_in?
      @current_customer_post = Post.find_by(customer_id: current_customer.id, movie_id: @movie['id'])#ログインしている会員が閲覧中の映画のレビューを投稿しているかどうかを探す
    end
  end

  def search
    @genres = Genre.all
    @search_term = params[:looking_for]
    if @search_term.blank?
      flash[:danger] = "検索キーワードが入力されていません"
      redirect_to movies_path#検索ワードが空だった場合映画一覧画面に遷移
    else
      response = Movie.search(@search_term)#検索ワードを基準に映画情報を取得
      @total_results = response["total_results"]
      unless @total_results == 0 #検索したワードにより１つ以上の検索結果が得られた場合
        @total_pages = response["total_pages"]#得られた情報のページ数を格納（１ページ19作品毎）
        @movie_results = response["results"]#得られた情報の総数を格納
        if @total_pages>1
          @total_pages = @total_pages>30 ? 30 : @total_pages#得られたページ数が2以上(20作品以上)の場合ページ数の上限を30に設定
          (2..@total_pages).each do |page|
            results = Movie.search(@search_term, page)["results"]#モデルで設定したメソッドの引数に検索ワードとページ数を渡す
            (0...results.count).each do |i|
              @movie_results << results[i]#改めて設定したページ数などを元に得られた情報の総数を代入
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
