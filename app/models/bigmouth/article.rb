module Bigmouth
  class Article < ActiveRecord::Base
    attr_accessor :author_name
    belongs_to :author, class_name: Bigmouth.author_class.to_s

    validate :check_if_author_exists

    before_save :set_author

    def check_if_author_exists
      author = Bigmouth.author_class.find_by(Bigmouth.username_key.to_sym => author_name)
      errors.add(:author, "doesn't exist") if author.blank?
    end

    private

      def set_author
        self.author = Bigmouth.author_class.find_by(Bigmouth.username_key.to_sym => author_name)
      end
  end
end
