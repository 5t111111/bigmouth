require "bigmouth/engine"

require "slim"
require "bootstrap-sass"
require "tinymce-rails"
require "truncate_html"
require "jquery-rails"

require "bigmouth/config"

module Bigmouth
  class << self
    def config
      @config ||= Config.new
    end

    def configure
      yield config if block_given?
    end
  end

  class Application < Rails::Application
    # SanitizeHelper configuration
    config.action_view.sanitized_allowed_tags = %w(h1 h2 h3 h4 h5 h6 p ul ol li a img table tr td em br strong)
    config.action_view.sanitized_allowed_attributes = %w(id class href)
  end
end
