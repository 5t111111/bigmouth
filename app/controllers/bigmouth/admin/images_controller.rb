require_dependency "bigmouth/application_controller"

module Bigmouth
  class Admin::ImagesController < Admin::ApplicationController

    layout "bigmouth/admin/dashboard"

    before_action :set_image, only: %i(show edit update destroy)
    before_action :action_requires_login

    def index
      @images = Bigmouth::Image.all
    end

    def show
    end

    def new
      @image = Bigmouth::Image.new
    end

    def edit
    end

    def create
      @image = Bigmouth::Image.new(image_params)
      @image.user_id = current_user.id

      if @image.save
        redirect_to admin_image_path(@image), notice: 'Image was successfully created.'
      else
        render :new
      end
    end

    def update
      if @image.update(image_params)
        redirect_to admin_image_path(@image), notice: 'Image was successfully updated.'
      else
        render :edit
      end
    end

    def destroy
      @image.destroy
      redirect_to admin_images_url, notice: 'Image was successfully destroyed.'
    end

    private
      # Only allow a trusted parameter "white list" through.
      def image_params
        params.require(:image).permit(:label, :image_file)
      end

      # Use callbacks to share common setup or constraints between actions.
      def set_image
        @image = Bigmouth::Image.find(params[:id])
      end
  end
end
