require "bigmouth/engine"

require "slim"
require "tinymce-rails"

module Bigmouth
  class Application < Rails::Application
    config.action_view.sanitized_allowed_tags = %w(h1 h2 h3 h4 h5 h6 p ul ol li a img table tr td em br strong)
    config.action_view.sanitized_allowed_attributes = %w(id class href)
  end
end
