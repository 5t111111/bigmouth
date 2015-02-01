require_dependency "bigmouth/application_controller"

module Bigmouth
  class Admin::FilesController < Admin::ApplicationController

    layout "bigmouth/admin/dashboard"

    before_action :set_file, only: %i(show edit update destroy)
    before_action :action_requires_login

    def index
      @files = Bigmouth::File.all
    end

    def show
    end

    def new
      @file = Bigmouth::File.new
    end

    def edit
    end

    def create
      @file = Bigmouth::File.new(file_params)
      @file.uploaded_by = current_user.id

      if @file.save
        redirect_to admin_file_path(@file), notice: 'File was successfully created.'
      else
        render :new
      end
    end

    def update
      if @file.update(file_params)
        redirect_to admin_file_path(@file), notice: 'File was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @file.destroy
      redirect_to admin_files_url, notice: 'File was successfully destroyed.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def file_params
        # params.require(:file).permit(:title, :text, :author_name)
        params.require(:file).permit(:name)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_file
        @file = Bigmouth::File.find(params[:id])
      end
  end
end
