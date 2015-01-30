module Bigmouth
  class Article < ActiveRecord::Base
    belongs_to :author, class_name: Bigmouth.config.author_class
    validates :title, presence: true
  end
end
