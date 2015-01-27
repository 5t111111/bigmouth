module Bigmouth
  module ArticlesHelper

    def article_author(article)
      if article.author
        article.author[Bigmouth.username_key.to_sym] || "Guest"
      else
        "Guest"
      end
    end
  end
end
