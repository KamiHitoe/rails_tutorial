
# Rails

Rails is a web application development framework written in the Ruby programming lang.
root files are application.html.erb and application.css, application.js
Rails supports `Webpack` and `Yarn`

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
  - Layout: layouts/
- Controller: app/controllers/
- Helper: app/helpers/
- Router: config/routes.rb
- Asset: app/assets/
  - Image: images/
  - CSS: stylesheets/
- Test: test/
- Gem: Gemfile


## App dev path

1. install gem. create rails app
2. generate controller
3. TDD in test/
4. UI design, transition design
5. routing
6. DB design

## View

- application.html.erb: top html file. this is template file for all view files
  - yield: this is function() or variable that is embedded from other component files
- other component files
  - provide: this sends props to template file by helper function


## routing

write config/routes.rb

```ruby
Rails.application.routes.draw do
  
  root 'Controller#homePath'
  # HTTP method
  get 'Controller/path'
end
```


## .html.erb(embedded ruby)

it it html file with embedded ruby. it makes `View` role in app

```ruby
# with output
<%=  %>

# without output
<%  %>

# render partial
<%= render "layouts/partial" %>

# link to another pages in views/
<%= link_to "Home", "/home"  %>
# with name path. below is same as above
<%= link_to "Home", home_path %>
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
# restore init version
rails db:migrate VERSION=0
```

make test colorful
```ruby
# testのGREEN, REDをわかりやすく表示
require 'minitest/reporters'
Minitest::Reporters.use!
```

exec guard(test automation)
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
