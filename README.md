# Bigmouth

**WORK IN PROGRESS: You should not use unless you are far too kind to contribute for the moment.**

Bigmouth is a mountable engine for creating simple blog pages for your application. 

## Prerequisites

Bigmouth assume that `current_user` method exists, so there is a need to have it in your authentication system like Devise or Sorcery.

## Installation

```text
gem "bigmouth"
```

## Set an end point

`config/routes.rb`

```ruby
mount Bigmouth::Engine, at: "/blog"
```

## Specify User class

Bigmouth needs User class for author of articles, so at least you must specify it in initializer.

`config/initializers/bigmouth.rb`

```ruby
Bigmouth.configure do |config|
  # Set a class for user model (default: User)
  config.user_class = "User"
end if defined?(Bigmouth)

```

## Set association between user and articles

`user.rb`

```ruby
has_many :articles, class_name: "Bigmouth::Article", foreign_key: "user_id"
has_many :images, class_name: "Bigmouth::Image", foreign_key: "user_id"
```

## Install migrations

```console
$ bundle exec rake bigmouth:install:migrations
```


## Configuration

`config/initializers/bigmouth.rb`

```ruby
Bigmouth.configure do |config|
  # Set a class for user model (default: User)
  config.user_class = "User"
  # Set a field for username (default: email)
  config.username_key = "email"
  # Set a layout (default: bigmouth/default)
  #config.layout = "application"
  # Set summary length to truncate (default: 200)
  config.summary_length = 100
  # Set date and time format
  config.datetime_format = "%B %d, %Y at %l:%M %p"
  # Set uri and method to sign in
  config.sign_in_uri = { uri: "/login", method: :get }
  # Set uri and method to sign out
  config.sign_out_uri = { uri: "/logout", method: :post }
end if defined?(Bigmouth)
```

## FAQ

### If you want to share a layout between the main app and Bigmouth

1. Set `config.layout` in a initializer (see above)
2. Rename named routes in your layout to the prefixed with `main_app` ones such as `main_app.root_path`
3. If you want to use named route within Bigmouth in your layout, prefix `bigmouth` like `bigmouth.root_path`

## License

This project rocks and uses MIT-LICENSE.

