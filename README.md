# フィルモア Filmore

## サイト概要
### サイトテーマ
映画のレビューを投稿、共有でき、これまで観た映画情報などを整理できる映画レビューサイト

### テーマを選んだ理由
2021年の映画公開本数は邦画490本、洋画469本、合わせて959本にのぼる。
毎年1000本以上の映画が公開され、それと同時に近年ではオンデマンドなどの映画のデジタル配信なども盛んとなり、
より多くの人が映画を鑑賞する機会が増加していると考えられるだろう。
このような時代にあって、映画が好きな人にとってこれまで観た映画、その映画の感想、
そしてこれから観たい映画を把握できるようなツールは非常に有意義であると考えられる。
そこで、自分が観た映画の情報の管理と、レビューなどを通して他者との感想の共有を可能にするような映画レビューサイトを構想した。
こうしたレビューサイトを活用することで、既に観た映画を忘れて重複して鑑賞するようなことを防ぐことができ、観たかった映画を見逃すようなことも防ぐことができる。
また、レビューなどの意見交換を通してこれまで触れてこなかったジャンルの映画にも挑戦する機会が生まれるサイトになることが理想である。


### ターゲットユーザ
- 今まで観た映画の情報を管理したい人
- 観た映画の感想を共有したい人
- これから観たい映画の情報を管理したい人
- 他者の映画のレビューなどを観て、その映画を観るかどうか参考にしたい人
- これまで触れてこなかったジャンルの映画にも挑戦したい人

### 主な利用シーン
【映画情報管理】

- 今までみた映画の情報を管理したいとき。
- これから観たい映画の情報を管理したいとき。
【映画の感想共有】

- 観た映画のレビューを書きたいとき。
- 書いたレビューを再度確認したいとき。
- 他人のレビューを閲覧し、新たな映画を観る上で参考にしたいとき

## 設計書
- テーブル定義書　https://docs.google.com/spreadsheets/d/1KOzaAwVT-nboowtDXHW5SqhSFeTCPIps6RcUE1eFuwo/edit#gid=1931723813
- ER図　https://app.diagrams.net/#G1rrGJwYv9Ra2Kr7b41EsjI1SOrkzmpNfx
- 詳細設計　https://docs.google.com/spreadsheets/d/1hJdUxECJXC1UuhfmhiwvRa-tvQy__pQw4XTmYAs6DrY/edit#gid=2133469642
- ワイヤーフレーム　https://docs.google.com/presentation/d/1_0ki8dYfgv5JtbXat8Ui4VlwHo0ft7eBAQfnYVLdGz4/edit#slide=id.g13156de9aee_0_85
- 実装機能リスト　https://docs.google.com/spreadsheets/d/1celKtAPX35y-4VIrue3OPAPhzfALINNnVDTuzaVMUCQ/edit#gid=1091086188

## 開発環境
- OS：Linux(CentOS)
- 言語：HTML,CSS,JavaScript,Ruby,SQL
- フレームワーク：Ruby on Rails
- JSライブラリ：jQuery
- IDE：Cloud9

## 使用素材
- TMDbのAPIより映画情報を取得 https://www.themoviedb.org/
