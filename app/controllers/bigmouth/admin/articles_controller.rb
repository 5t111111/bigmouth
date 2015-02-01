require_dependency "bigmouth/application_controller"

module Bigmouth
  class Admin::ArticlesController < ApplicationController

    layout "bigmouth/admin/application"

    before_action :set_article, only: %i(show edit update destroy)

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

    def create
      @article = Article.new(article_params)
      @article.author_id = current_user.id

      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    def update
      if @article.update(article_params)
        redirect_to admin_article_path(@article), notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def article_params
        # params.require(:article).permit(:title, :text, :author_name)
        params.require(:article).permit(:title, :text)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end
  end
end
