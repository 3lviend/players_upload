class ImagesController < ApplicationController
  before_action :set_image, only: [:destroy]

  # GET /images
  # GET /images.json
  def index
    @images = Image.all
  end

  # GET /images/new
  def new
    @image = Image.new
  end

  # POST /images
  # POST /images.json
  def create
    success, @failed = [], []
    respond_to do |format|
      image_params[:files].each do |p|
        @image = Image.new(file: p)
        if @image.save
          success << "#{p.original_filename} was successfully uploaded"
        else
          @failed << "#{p.original_filename}: #{@image.errors.messages.values.flatten.to_sentence}"

        end
      end
      if @failed.present?
        format.html { redirect_to images_url, alert: @failed, notice: success }
      else
        format.html { redirect_to images_url, notice: 'Images was successfully uploaded.' }
      end
    end
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    respond_to do |format|
      format.html { redirect_to images_url, notice: 'Image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit({files: []}, :file)
    end
end
