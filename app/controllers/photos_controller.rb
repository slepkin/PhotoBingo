class PhotosController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def destroy

  end

  def create
    @photo = Photo.new(params[:photo])

    unless @photo.save
      flash[:alert] = "Failed to upload file"
    end

    redirect_to cell_url(params[:photo][:cell_id])
  end
end