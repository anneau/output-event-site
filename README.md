# output-event-site
Nuxt.js & Ruby on Railsで作成された特設サイトです。

## 開発環境
<p>
<img src="https://img.shields.io/badge/Rails-5.2.4-CC342D.svg?logo=ruby&style=plastic">
<img src="https://img.shields.io/badge/Nuxt.js-2.14.0-00C58E.svg?logo=nuxt.js&style=plastic">
<img src="https://img.shields.io/badge/-Docker-1488C6.svg?logo=docker&style=plastic">
<img src="https://img.shields.io/badge/-Amazon%20aws-232F3E.svg?logo=amazon-aws&style=plastic">
</p>

## 開発セットアップ
### コンテナのビルド
$ docker-compose build
### seedデータの流し込み
$ docker-compose run --rm api rake db:seed_fu
### 立ち上げ
$ docker-compose up -d

### 開発の流れ
1. 必要な機能をissue化
2. ローカル上で`feat/{#issue番号}`のブランチを切り、開発
3. `feat/{#issue番号}`のリモートブランチにpush
4. masterにプルリクエストを送る
5. masterにマージ
