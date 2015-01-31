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

    def sidebar_activate(sidebar_link_url)
      current_url = request.headers["PATH_INFO"]
      # The below logic needs to be fix ...
      Regexp.new(current_url) =~ sidebar_link_url ? ' class="active"' : ""
    end

    def sidebar_list_items
      items = [
        { text: "Articles", path: admin_articles_path }
      ]

      html = ""
      items.each do |item|
        text = item[:text]
        path = item[:path]
        html += %(<li#{sidebar_activate(path)}><a href="#{path}">#{text}</a></li>)
      end

      html.html_safe
    end
  end
end
