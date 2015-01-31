Bigmouth.configure do |config|
  # Set a class for user model (default: User)
  config.author_class = "User"
  # Set a field for username (default: email)
  config.username_key = "email"
  # Set a layout (default: bigmouth/default)
  #config.layout = "application"
  # Set summary length to truncate (default: 200)
  config.summary_length = 100
  # Set date and time format
  config.datetime_format = "%B %d, %Y at %l:%M %p"
end if defined?(Bigmouth)
