class Public::HomesController < ApplicationController

  def top
    response = Movie.now_playing#公開中の映画情報を取得
    @movies = Array.new#配列の初期化
    response.each do |m|
      if !m["poster_path"].blank?
        @movies << m  #ポスター画像が存在する場合のみ初期化した配列に映画情報を格納
      end
    end
  end

  def about
  end
end
