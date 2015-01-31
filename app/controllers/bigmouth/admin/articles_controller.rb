require_dependency "bigmouth/application_controller"

module Bigmouth
  class Admin::ArticlesController < ApplicationController

    layout "bigmouth/admin/application"

    def index
      @articles = Article.all
    end
  end
end
