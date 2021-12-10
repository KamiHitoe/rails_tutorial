
# Rails

Rails is a web application development framework written in the Ruby programming lang.

first, you set ruby version for AWS Cloud9
```ruby
rvm use 2.6.6
```

## Get Started

```shell
# install
gem install rails
# create app
rails "APP_NAME"
# run app
bin/rails server
```



## directory structure

- Model: app/models/
- View: app/views/
- Controller: app/controllers/
- Helper: app/helpers/
- Router: config/routes.rb
- Asset: app/assets/
- Test: test/
- Gem: Gemfile


## Webアプリ開発手順

1. gemのインストール。railsのビルド
2. controllerのgenerate
3. testによるTDD開発
4. 画面モックとUI設計
5. routing
6. DBモデル設計


## erb(embedded ruby)
```ruby
# 出力なし
<%  %>

# 出力あり
<%=  %>
```


## rails commands

appの初期設定
```ruby
bundle install --without production
rails db:migrate
rails test
rails server
```

Cloud9での接続設定
```ruby
# config/environment/development.rb
  # Cloud9への接続を許可
  config.hosts.clear
```

rails generate
```ruby
# controller
rails generate controller "controller_name" "actions"

# remove
rails destroy controller "controller_name" "actions"

# model
rails generate model "model_name" "fields:type"

# remove
rails destroy model "model_name"
```

rails db
```ruby
# 生成
rails db:migrate

# 復元
rails db:rollback

# 最初に戻す
rails db:migrate VERSION=0
```

testの彩色
```ruby
# testのGREEN, REDをわかりやすく表示
require 'minitest/reporters'
Minitest::Reporters.use!
```

guard(test自動化)の実行
```ruby
# initialize
bundle exec guard init

# run
bundle exec guard
```


## heroku commands

master以外のbranchで作業している時は、一度localのmaterブランチにmergeしてpushする必要がある

```ruby
# login
heroku login --interactive # ブラウザを開かない

# create app
heroku create "app_name"

# rename
heroku raname "new_app_name"

# push
git push heroku master

# log
heroku logs
```
