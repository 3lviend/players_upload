class PlaysController < ApplicationController
  def create
    @play = Play.new(play_params)
    respond_to do |format|
	    if @play.save
	      format.json { render json: @play , status: :ok }
	    else
	      format.json { render json: @play.errors.full_messages.to_sentence, status: :unprocessable_entity }
	    end
	  end
  end

  private
  def play_params
    params.require(:play).permit(:image_id, :second)
  end
end