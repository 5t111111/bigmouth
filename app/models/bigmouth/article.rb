module Bigmouth
  class Article < ActiveRecord::Base
    belongs_to :user, class_name: Bigmouth.config.user_class
    validates :title, presence: true

    default_scope { order created_at: :desc }
  end
end
