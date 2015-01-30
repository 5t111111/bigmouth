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
  config.author_class = "User"
end if defined?(Bigmouth)

```

## Set association between user and articles

`user.rb`

```ruby
has_many :articles, class_name: "Bigmouth::Article", foreign_key: "author_id"
```

## Configuration

`config/initializers/bigmouth.rb`

```ruby
Bigmouth.configure do |config|
  # Set a class for user model (default: User)
  config.author_class = "User"
  # Set a field for username (default: email)
  config.username_key = "email"
  # Set a layout (default: bigmouth/default)
  config.layout = "application"
  # Set summary length to truncate (default: 20 words)
  config.summary_length = 10
end if defined?(Bigmouth)
```

## License

This project rocks and uses MIT-LICENSE.

