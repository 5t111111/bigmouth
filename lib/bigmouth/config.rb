require "active_support/configurable"

module Bigmouth
  class Config
    include ActiveSupport::Configurable

    config_accessor :author_class
    config_accessor :layout
    config_accessor :username_key
    config_accessor :summary_length
    config_accessor :datetime_format

    configure do |config|
      config.author_class = "User"
      config.layout = "bigmouth/default"
      config.username_key = "email"
      config.summary_length = 20
      config.datetime_format = "%B %d, %Y at %l:%M %p"
    end
  end
end
