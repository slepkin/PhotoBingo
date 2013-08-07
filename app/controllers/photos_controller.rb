class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def destroy
    @photo = Photo.find(params[:id])
    if @photo.cell.board.user == current_user
      @photo.destroy
    else
      flash[:alert] = "Not your photo."
    end
    redirect_to :back
  end

  def create
    @photo = Photo.new(params[:photo])

    unless @photo.save
      flash[:alert] = "Failed to upload file"
    end

    redirect_to cell_url(params[:photo][:cell_id])
  end
end