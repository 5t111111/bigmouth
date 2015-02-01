require_dependency "bigmouth/application_controller"

module Bigmouth
  class Admin::ArticlesController < ApplicationController

    layout "bigmouth/admin/dashboard"

    before_action :set_article, only: %i(show edit update destroy)
    before_action :action_requires_login

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

      def action_requires_login
        if current_user.blank?
          redirect_back_or_to Bigmouth.config.sign_in_uri[:uri],
                              alert: "You are not permitted to do this action."
        end
      end
  end
end
