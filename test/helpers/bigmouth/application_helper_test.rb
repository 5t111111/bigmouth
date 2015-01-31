require "test_helper"

module Bigmouth
  class ApplicationHelperTest < ActionView::TestCase
    setup do
      @article = bigmouth_articles(:bigmouth_Strikes_again)
      Bigmouth.configure do |config|
        config.author_class = "User"
        config.username_key = "email"
        config.layout = "bigmouth/default"
        config.summary_length = 100
        config.datetime_format = "%B %d, %Y at %l:%M %p"
      end
    end

    # To provide truncate_html to test context,
    # need to define bridge trucate_html which some tests depends on.
    def truncate_html(html, options={})
      return '' if html.nil?
      html_string = TruncateHtml::HtmlString.new(html)
      TruncateHtml::HtmlTruncator.new(html_string, options).truncate.html_safe
    end

    test "should return article author when it has author" do
      assert_equal "morrissey@example.com", article_author(@article)
    end

    test "should return Guest when it doesn't have author" do
      @article.author_id = ""
      assert_not @article.author.present?
      assert_equal "Guest", article_author(@article)
    end

    test "should return Guest when it doesn't have username_key" do
      Bigmouth.config.username_key = "non_existence"
      assert_equal "Guest", article_author(@article)
    end

    test "should return summary based on summary_length" do
      Bigmouth.config.summary_length = 25
      assert_equal "Sweetness, sweetness I...", summary(@article)
    end

    test "should return summary based on summary_length (Japanese)" do
      @article.text = <<-EOS
可愛い人、可愛い人、ただの冗談だよ
君の頭を殴りつけて
その歯を全部砕いてしまいたいなんて言ったのは
      EOS
      Bigmouth.config.summary_length = 30
      assert_equal "可愛い人、可愛い人、ただの冗談だよ 君の頭を殴りつけて...", summary(@article)
    end
  end
end
