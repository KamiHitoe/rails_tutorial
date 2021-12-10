
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
# or
rails server
```

## install modules

```shell
# config to install without modules for production
bundle config set --local without 'production'
#update
bundle update
# install modules in Gemfile
bundle install
# init webpacker
rails webpacker:install
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


## App dev path

1. install gem. create rails app
2. generate controller
3. TDD in test/
4. UI design, transition design
5. routing
6. DB design


## routing

write config/routes.rb

```ruby
Rails.application.routes.draw do
  
  root 'Controller#homePath'
  get 'Controller/path'
end
```


## erb(embedded ruby)
```ruby
# 出力なし
<%  %>

# 出力あり
<%=  %>
```


## Rails Commands

```ruby
rails db:migrate
rails test
rails console
rails server
```

config Cloud9 connection
```ruby
# config/environment/development.rb
  # allow to connect with Cloud9
  config.hosts.clear
```

rails generate controller or model
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
# generate
rails db:migrate
# restore
rails db:rollback
# init
rails db:migrate VERSION=0
```

make test colorful
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

you need to push after merge temporary branch to master branch, when you work in another branch but master


```ruby
# login
heroku login --interactive # ブラウザを開かない
# create app
heroku create "APP_NAME"
# rename
heroku raname "NEW_APP_NAME"
# push
git push heroku master
# log
heroku logs
```
