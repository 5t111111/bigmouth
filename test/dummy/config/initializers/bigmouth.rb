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
  # Set uri and method to sign in
  config.sign_in_uri = { uri: "/login", method: :get }
  # Set uri and method to sign out
  config.sign_out_uri = { uri: "/logout", method: :post }
end if defined?(Bigmouth)
