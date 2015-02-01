require "active_support/configurable"

module Bigmouth
  class Config
    include ActiveSupport::Configurable

    config_accessor :user_class
    config_accessor :layout
    config_accessor :username_key
    config_accessor :summary_length
    config_accessor :datetime_format
    config_accessor :sign_in_uri
    config_accessor :sign_out_uri

    configure do |config|
      config.user_class = "User"
      config.layout = "bigmouth/default"
      config.username_key = "email"
      config.summary_length = 20
      config.datetime_format = "%B %d, %Y at %l:%M %p"
      config.sign_in_uri = { uri: "/sign_in", method: :get }
      config.sign_out_uri = { uri: "/sign_out", method: :post }
    end
  end
end
