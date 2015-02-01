module Bigmouth
  class File < ActiveRecord::Base
    belongs_to :user, class_name: Bigmouth.config.user_class
  end
end
