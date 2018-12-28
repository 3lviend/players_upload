class ImagesController < ApplicationController

  def new
    @image = Image.new
  end

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
        format.html { redirect_to play_random_path, alert: @failed, notice: success }
      else
        format.html { redirect_to play_random_path, notice: 'Images was successfully uploaded.' }
      end
    end
  end

  def play_random
    size       = rand(1..10)
    @images    = Image.all.map{ |p| [p.file.url, p.id] }.sample(size)
    @plays     = Play.all.order(created_at: :desc)
    @new_array = @images
    multiple   = 10 / @images.size

    (@images * multiple).each do |a|
      @new_array << a if (@new_array.size < 10)
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit({files: []}, :file)
    end
end
