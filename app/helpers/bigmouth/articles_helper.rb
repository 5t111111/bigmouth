module Bigmouth
  module ArticlesHelper

    def article_author(article)
      if article.author.present?
        article.author[Bigmouth.config.username_key.to_sym] || "Guest"
      else
        "Guest"
      end
    end

    def summary(article)
      truncate_html sanitize(article.text),
                    length: Bigmouth.config.summary_length,
                    omission: "..."
    end
  end
end
