module Bigmouth
  module ApplicationHelper
    # Returns Bootstrap friendly type
    def alert_class_for(flash_type)
      {
        success: 'alert-success',
        error: 'alert-danger',
        danger: 'alert-danger',
        alert: 'alert-warning',
        notice: 'alert-info'
      }[flash_type.to_sym] || flash_type.to_s
    end

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
