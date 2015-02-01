require_dependency "bigmouth/application_controller"

module Bigmouth
  class ArticlesController < ApplicationController

    layout "bigmouth/default"

    before_action :set_article, only: %i(show)

    # GET /articles
    def index
      @articles = Article.all
      render :index, layout: Bigmouth.config.layout
    end

    # GET /articles/1
    def show
      render :show, layout: Bigmouth.config.layout
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end
  end
end
