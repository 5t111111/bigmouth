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

Bigmouth needs User class for author of articles, so you should specify it in initializer.

`config/initializers/bigmouth.rb`

```ruby
Bigmouth.author_class = "User"
```

## Set association between user and articles

`user.rb`

```ruby
has_many :articles, class_name: "Bigmouth::Article", foreign_key: "author_id"
```

## Configuration

`config/initializers/bigmouth.rb`

```ruby
# Set a class for user model (default: User)
Bigmouth.author_class = "User"
# Set a field for username (default: email)
Bigmouth.username_key = "email"
# Set a layout (default: bigmouth/default)
Bigmouth.layout = "application"
# Set summary length to truncate (default: 20 words)
Bigmouth.summary_length = 10
```

## License

This project rocks and uses MIT-LICENSE.

