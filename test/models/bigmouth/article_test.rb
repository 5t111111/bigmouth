require 'test_helper'

module Bigmouth
  class ArticleTest < ActiveSupport::TestCase
    def setup
      @article = Article.new(title: "Bigmouth Strikes Again",
                             text: "Sweetness, sweetness I was only joking when I said I'd like to smash every tooth in your head",
                             author_id: 1)
    end

    test "should be valid" do
      assert @article.valid?
    end

    test "should be invalid when title is blank" do
      @article.title = ""
      assert_not @article.valid?
    end
  end
end
