class Public::HomesController < ApplicationController

  def top
    response = Movie.now_playing                                                #公開中の映画情報を取得
    @movies = Array.new                                                         #配列の初期化
    response.each do |m|
      if !m["backdrop_path"].blank?
        @movies << m                                                            #backdrop_pathが空白だった場合は初期化した配列に公開中の映画の情報を格納
      end
    end
  end

  def about
  end
end
