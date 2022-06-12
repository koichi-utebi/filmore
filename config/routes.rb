Rails.application.routes.draw do

  scope module: :public do                                                      #会員側ルーティング
    root :to => 'homes#top'                                                       #トップページ
    get '/about' => 'homes#about', as: 'about'                                    #アバウトページ
    resources :customers, only: [:show, :edit, :update] do                        #会員関連
      get '/quit_check' => 'customers#quit_check', as: 'quit_check'                 #退会確認ページ
      patch '/withdraw' => 'customers#withdraw', as: 'withdraw'                     #会員ステータス更新
      resource :relationships, only: [:create,:destroy]                             #リレーション関連             #フォロワー一覧
    end
    resources :movies, only: [:index, :show]                                    #映画関連
    get '/search' => 'movies#search', as: 'search'                              #映画タイトル検索
    get '/genre_search' => 'movies#genre_search', as: 'genre_search'            #ジャンル絞り込み
    get '/posts/check' => 'posts#check', as: 'check_post'                         #新規投稿確認ページ
    resources :posts do                                                           #投稿関連
      resource :favorites, only: [:create, :destroy]                                #いいね関連
      resource :comments, only: [:create, :destroy]                                 #コメント関連
    end
    get '/favorites/index' => 'favorites#index', as: 'favorites'                  #いいねした投稿一覧ページ
    resources :watched_lists, only: [:create, :destroy]                         #視聴済みリスト関連
    resources :wish_lists, only: [:create, :destroy]                            #ウィッシュリスト関連
  end

  namespace :admin do                                                           #管理者側ルーティング
    root :to => 'posts#index'                                                     #投稿一覧ページ
    resources :customers, only: [:index, :show, :edit, :update]                   #会員関連
    resources :posts, only: [:show, :update]                                      #投稿関連
  end


  devise_for :customer,skip: [:passwords], controllers: {
    registrations: "public/registrations",                                      #会員側新規登録関連
    sessions: 'public/sessions'                                                 #会員側サインイン関連
  }

  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"                                                  #管理者側サインイン関連
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
