module Bigmouth
  module Admin::ApplicationHelper

    include Bigmouth::ApplicationHelper

    def file_uploaded_by(file)
      if file.uploaded_by.present?
        file.uploaded_by[Bigmouth.config.username_key.to_sym] || "Guest"
      else
        "Guest"
      end
    end

    def sidebar_activate(sidebar_link_url)
      current_url = request.headers["SCRIPT_NAME"] + request.headers["PATH_INFO"]
      current_url.match(sidebar_link_url) ? ' class="active"' : ""
    end

    def sidebar_list_items
      items = [
        { text: "Articles", path: admin_articles_path },
        { text: "Files", path: admin_files_path }
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
