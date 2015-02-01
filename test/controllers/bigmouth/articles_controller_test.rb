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

    test "should show article" do
      get :show, id: @article
      assert_response :success
    end
  end
end
