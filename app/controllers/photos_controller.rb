class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.user == current_user
      @photo.destroy
    else
      flash[:alert] = "Not your photo."
    end
    redirect_to :back
  end

  def create
    @photo = Photo.new(params[:photo])
    @game = @photo.cell.game
    @owner = @photo.cell.user

    if @owner != current_user
      flash[:alert] = "This cell is not on your board."
    elsif @game.pending_votes(current_user).present?
      debugger
      flash[:alert] = "You cannot submit a photo until you have voted on all pending photos!"
    elsif !@photo.save
      flash[:alert] = @photo.errors.full_messages.join("\n")
    end

    redirect_to cell_url(params[:photo][:cell_id])
  end
end