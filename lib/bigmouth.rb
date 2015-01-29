require "bigmouth/engine"

require "slim"
require "bootstrap-sass"
require "tinymce-rails"
require "truncate_html"
require "jquery-rails"

module Bigmouth
  mattr_accessor :author_class
  mattr_accessor :layout
  mattr_accessor :username_key

  class << self
    def author_class
      @@author_class ? @@author_class.constantize : "User"
    end

    def layout
      @@layout || "bigmouth/default"
    end

    def username_key
      @@username_key || "email"
    end
  end

  class Application < Rails::Application
    # SanitizeHelper configuration
    config.action_view.sanitized_allowed_tags = %w(h1 h2 h3 h4 h5 h6 p ul ol li a img table tr td em br strong)
    config.action_view.sanitized_allowed_attributes = %w(id class href)
  end
end
