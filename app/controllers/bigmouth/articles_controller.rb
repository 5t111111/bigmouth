require_dependency "bigmouth/application_controller"

module Bigmouth
  class ArticlesController < ApplicationController

    layout Bigmouth.layout

    before_action :set_article, only: %i(show edit update destroy)
    before_action :action_requires_login, except: %i(index show)

    # GET /articles
    def index
      @articles = Article.all
    end

    # GET /articles/1
    def show
    end

    # GET /articles/new
    def new
      @article = Article.new
      render :new, layout: "bigmouth/default"
    end

    # GET /articles/1/edit
    def edit
      render :edit, layout: "bigmouth/default"
    end

    # POST /articles
    def create
      @article = Article.new(article_params)
      @article.author_id = current_user.id

      if @article.save
        redirect_to @article, notice: 'Article was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /articles/1
    def update
      if @article.update(article_params)
        redirect_to @article, notice: 'Article was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /articles/1
    def destroy
      @article.destroy
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_article
        @article = Article.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def article_params
        # params.require(:article).permit(:title, :text, :author_name)
        params.require(:article).permit(:title, :text)
      end

      def action_requires_login
        if current_user.blank?
          redirect_back_or_to root_path, alert: "You are not permitted to do this action."
        end
      end
  end
end
