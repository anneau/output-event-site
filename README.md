# output-event-site
Nuxt.js & Ruby on Railsで作成された特設サイトです。

## 開発セットアップ
### コンテナのビルド
$ docker-compose build
### 立ち上げ
$ docker-compose up -d

### 開発の流れ
1. 必要な機能をissueにする
2. ローカル上で`feat/{#issue番号}`のブランチを切り、開発
3. `feat/{#issue番号}`のリモートブランチにpush
4. masterにプルリクエストを送る
5. マージ
