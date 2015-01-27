module Bigmouth
  class Article < ActiveRecord::Base
    belongs_to :author, class_name: Bigmouth.author_class.to_s
  end
end
