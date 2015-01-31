require_dependency "bigmouth/application_controller"

module Bigmouth
  class Admin::ArticlesController < ApplicationController

    layout "bigmouth/admin/application"

    before_action :set_article, only: %i(show edit destroy)

    def index
      @articles = Article.all
    end

    def show
    end

    def new
      @article = Article.new
    end

    def edit
    end

    def destroy
      puts "*" * 50
      puts "FUCK ME"
      puts "*" * 50
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end
  end
end
