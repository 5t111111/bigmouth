module Bigmouth
  class File < ActiveRecord::Base
    belongs_to :uploaded_by, class_name: Bigmouth.config.author_class
  end
end
