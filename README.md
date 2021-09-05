
# rails_tutorial

## 構造

- Model: app/models/
- View: app/views/
- Controller: app/controllers/
- Router: config/routes.rb
- Asset: app/assets/

## rails commands

```python
bundle install --without production
rails db:migrate
rails test
rails server
```

```python:config/environment/development.rb
  # Cloud9への接続を許可
  config.hosts.clear
```


## heroku commands

```python
# login
heroku login --interactive # ブラウザを開かない

# create app
heroku create "app_name"

# rename
heroku raname "new_app_name"
```

