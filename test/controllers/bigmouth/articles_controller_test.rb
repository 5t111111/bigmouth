require 'test_helper'

module Bigmouth
  class ArticlesControllerTest < ActionController::TestCase
    setup do
      @routes = Bigmouth::Engine.routes
      @article = bigmouth_articles(:one)
      @user = users(:one)
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
    end

    # test "should create article" do
    #   assert_difference('Article.count') do
    #     post :create, article: { text: @article.text, title: @article.title }
    #   end

    #   assert_redirected_to article_path(assigns(:article))
    # end

    # test "should show article" do
    #   get :show, id: @article
    #   assert_response :success
    # end

    # test "should get edit" do
    #   get :edit, id: @article
    #   assert_response :success
    # end

    # test "should update article" do
    #   patch :update, id: @article, article: { text: @article.text, title: @article.title }
    #   assert_redirected_to article_path(assigns(:article))
    # end

    # test "should destroy article" do
    #   assert_difference('Article.count', -1) do
    #     delete :destroy, id: @article
    #   end

    #   assert_redirected_to articles_path
    # end
  end
end
