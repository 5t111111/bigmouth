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
