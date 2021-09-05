
# rails_tutorial

## 開発手順
1. gemのインストール。railsのビルド
2. controllerのgenerate
3. testによるTDD開発

## 構造

- Model: app/models/
- View: app/views/
- Controller: app/controllers/
- Router: config/routes.rb
- Asset: app/assets/

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

