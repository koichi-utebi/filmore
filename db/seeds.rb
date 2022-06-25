# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Genre.create!(
  [
    {
      genre_ids: 28,
      name: 'アクション',
    },
    {
      genre_ids: 12,
      name: 'アドベンチャー',
    },
    {
      genre_ids: 16,
      name: 'アニメーション',
    },
    {
      genre_ids: 35,
      name: 'コメディ',
    },
    {
      genre_ids: 80,
      name: 'サスペンス',
    },
    {
      genre_ids: 99,
      name: 'ドキュメンタリー',
    },
    {
      genre_ids: 18,
      name: 'ドラマ',
    },
    {
      genre_ids: 10751,
      name: 'ファミリー',
    },
    {
      genre_ids: 14,
      name: 'ファンタジー'
    },
    {
      genre_ids: 36,
      name: '歴史'
    },
    {
      genre_ids: 27,
      name: 'ホラー'
    },
    {
      genre_ids: 10402,
      name: '音楽',
    },
    {
      genre_ids: 9648,
      name: 'ミステリー',
    },
    {
      genre_ids: 10749,
      name: 'ロマンス'
    },
    {
      genre_ids: 878,
      name: 'SF',
    },
    {
      genre_ids: 10770,
      name: 'テレビ映画',
    },
    {
      genre_ids: 53,
      name: 'スリラー',
    },
    {
      genre_ids: 10752,
      name: '戦争'
    },
    {
      genre_ids: 37,
      name: '西洋',
    },
  ]
)