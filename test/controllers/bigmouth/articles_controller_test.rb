require 'test_helper'

module Bigmouth
  class ArticlesControllerTest < ActionController::TestCase
    setup do
      @routes = Bigmouth::Engine.routes
      @article = bigmouth_articles(:bigmouth_Strikes_again)
      @user = users(:morrissey)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:articles)
      assert_template "bigmouth/articles/index"
    end

    test "should get new when logging in" do
      login_user
      get :new
      assert_response :success
      assert_template "bigmouth/articles/new"
    end

    test "should not get new without logging in" do
      get :new
      assert_redirected_to root_path
      assert flash[:alert].present?
    end

    test "should create article when logging in" do
      login_user
      assert_difference('Article.count') do
        post :create, article: { text: @article.text, title: @article.title }
      end

      assert_redirected_to article_path(assigns(:article))
    end

    test "should not create article without logging in" do
      assert_no_difference('Article.count') do
        post :create, article: { text: @article.text, title: @article.title }
      end

      assert flash[:alert].present?
      assert_redirected_to root_path
    end

    test "should show article" do
      get :show, id: @article
      assert_response :success
    end

    test "should get edit when logging in" do
      login_user
      get :edit, id: @article
      assert_response :success
    end

    test "should not get edit without logging in" do
      get :edit, id: @article
      assert flash[:alert].present?
      assert_redirected_to root_path
    end

    test "should update article when logging in" do
      login_user
      patch :update, id: @article, article: { text: "New Text", title: "New Title" }

      assert_equal Article.find(@article.id).text, "New Text"
      assert_equal Article.find(@article.id).title, "New Title"
      assert_redirected_to article_path(assigns(:article))
    end

    test "should not update article without logging in" do
      patch :update, id: @article, article: { text: @article.text, title: @article.title }
      assert_not_equal Article.find(@article.id).text, "New Text"
      assert_not_equal Article.find(@article.id).title, "New Title"
      assert flash[:alert].present?
      assert_redirected_to root_path
    end

    test "should destroy article when logging in" do
      login_user
      assert_difference('Article.count', -1) do
        delete :destroy, id: @article
      end

      assert_redirected_to articles_path
    end

    test "should not destroy article without logging in" do
      assert_no_difference('Article.count') do
        delete :destroy, id: @article
      end

      assert flash[:alert].present?
      assert_redirected_to root_path
    end
  end
end
