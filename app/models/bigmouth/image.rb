module Bigmouth
  class Image < ActiveRecord::Base
    belongs_to :user, class_name: Bigmouth.config.user_class

    attachment :image_file, type: :image

    default_scope { order('created_at DESC') }
  end
end
