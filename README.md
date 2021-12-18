
tmp: ~ 8.1.1

Rails is a web application development framework written in the Ruby programming lang.
root files are application.html.erb and application.css, application.js
Rails supports `Webpack` and `Yarn`

first, you set ruby version for AWS Cloud9
```ruby
rvm use 2.6.6
```

# Get Started

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


# Directory structure

- Model: app/models/
- View: app/views/
  - Layout: layouts/
- Controller: app/controllers/
- Helper: app/helpers/
- Router: config/routes.rb
- Schema: db/schema.rb
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

# View

- application.html.erb: top html file. this is template file for all view files
  - yield: this is function() or variable that is embedded from other component files
- other component files
  - provide: this sends props to template file by helper function


## Routing

write config/routes.rb

```ruby
Rails.application.routes.draw do
  
  root 'Controller#homePath'
  # HTTP method
  get 'Controller/path'
end
```

### named URL

```ruby:config/routes.rb
# prev
get 'controller/path'
# next
get '/pathName', to: 'controller#pathName' # = pathName/path
```

show all routes
```shell
rails routes
```

# Embedded ruby(viewFile.html.erb)

it it html file with embedded ruby. it makes `View` role in app

```ruby
# with output
<%=  %>
# without output
<%  %>
# add attribute
<%= , attribute: value %>

# render partial
<%= render "layouts/partial" %>

# link to another pages in views/
<%= link_to "Home", "/home"  %>
# with name path. below is same as above
<%= link_to "Home", home_path %>

# receive props
<%= yield(:props) %>
# send props
<% provide(:props, value) %>

# create form with model
<%= form_with(model: @model, local: true) do |f| %>
  <%= f.label :value %>
  <%= f."type_field" :value %>
<% end %>
# create form without model
<%= form_with(url: pathName_path, scope: :controller, local: true) do |f| %>
  <%= f.label :value %>
  <%= f."type_field" :value %>
<% end %>
```

## Partial

it is HTML component. it can be reused in .erb files

- app/views/layouts/_partial.html.erb


# Controller

generate controllers
  - create app/controllers/Controller.rb
  - create app/views/controller/action/html.erb
  - create test/controllers/Controller_text.rb
  - create app/helpers/Controller_helper.rb
  - create app/assets/javascripts/Controller.coffee
  - create app/assets/stylesheets/Controller.scss
  - route get '*'
```ruby
# controller
rails generate controller "controllers_name" "actions"
# remove
rails destroy controller "controllers_name" "actions"
```


## Helper

it is helper `function`. it can be reused in every .rb or .erb files

- app/controllers/helpers/*_helper.rb


# Model

it is a Class Object.

generate model. it automatically generate "created_at" and "updated_at" fields
  - create db/migrate/*.models.rb
  - create app/models/model.rb
  - create test/models/model_test.rb
  - create test/fixtures/models.yml
```ruby
# model
rails generate model "model_name" "column:type"
# remove
rails destroy model "model_name"
```

rails db
```ruby
# create schema from model
rails db:migrate
rails db:migrate RAILS_ENV=production # migrate into production env
# rollback
rails db:rollback
# fields reset
rails db:migrate:reset
# restore init version
rails db:migrate VERSION=0
# migrate schema
rails generate migration "migrate_name" "column:type"
```



## ORM(Object Relational Mapping)

Rails's ORM is `Active Record`. 

- model = class(db/migrate/model.rb) named singular with capitalized first letter
- teble = schema(db/migrate/schema.rb) named plural words


create
```ruby
field1 = Model.new do |f|
  f.column1 = value1
  f.column2 = value2
end
field1.save
# below is same
field1 = Model.create(column1: value1, column2: value2)
```
read
```ruby
# full-table scan
Model.all
# get first field
Model.first
# get last field
Model.last
# get by column
Model.find_by(column: value)
# WHERE, ORDER, LIMIT
Model.where(column: value).order(column: :desc).limit(n)
```
update
```ruby
field = Model.find_by(column: value)
field.update(column: new_value)
```
delete
```ruby
# delete single field
Model.destroy_by(column: value)
# delete all fields
Model.destroy_all
```

## constraints

validate
  - presence: true or false
  - length: {maximum: x, minimum: y}
  - format: {with: /<re>/}
  - uniqueness: true or false, {case_sensitive: false}
```ruby:app/models/model.rb
  validates :column, key: value
```
```ruby:rails console
  f = Model.new({})
  f.valid? # true or false
  f.errors.full_messages # return error messages
```

## other

```shell:rails console
# return the number of fields
Model.count
```

## encrypt password

install bcrypt

```shell:Gemfile
gem 'bcrypt' '3.1.13'
# install on shell
bundle install
```

enable has_secure_password in model.rb.
it make "password_digest" column into schema.rb.
user should put "password" and "password_confirmation" values

```rb:app/models/model.rb
  has_secure_password
```

```shell:rails console
user = User.find_by(*)
user.authenticate("password") # return instance or false
```



# Test

write test/

- methods
  - assert(test, [msg]): ensures that test is true
  - assert_not(test, [msg]): ensures that test is false
  - assert_equal(expected, actual, [msg]): ensures that expected == actual is true
  - assert_empty(obj, [msg]): ensures that obj is empty?
  - assert_match(regexp, string, [msg]): ensures that a string matched the regular expression
  
  - assert_no_difference(expression) do: asserts that the numeric result of evaluating an expression is not changed before and after invoking the passed in block


make test colorful
```ruby
# make test code color GREEN or RED
require 'minitest/reporters'
Minitest::Reporters.use!
```

## Integration test

```ruby
# create test file
rails generate integration_test "test_name"
# run test code
rails test:integration
```

## Guard(test automation)

```ruby
# initialize
bundle exec guard init
# run
bundle exec guard
```



# Rails Commands

```ruby
# generate controllers or model
rails generate
# run testing
rails test
# exec irb on rails
rails console
rails console --sandbox # don't change db
rails console production # run in production env
# run puma
rails server
rails server --environment production # run puma in production env
```

config Cloud9 connection
```ruby
# config/environment/development.rb
  # allow to connect with Cloud9
  config.hosts.clear
```

## environment

1. development
2. test
3. production

activate ssl
```rb:config/environments/production.rb
  config.force_ssl = true
```


# Heroku commands

you need to push after merge temporary branch to master branch, when you work in another branch but master

create Procfile
```shell:./Procfile
web: bundle exec puma -C config/puma.rb
```

```ruby
# login
heroku login --interactive # don't open browser
# create app
heroku create "APP_NAME"
# rename
heroku raname "NEW_APP_NAME"
# push
git push heroku master
# log
heroku logs
```


