class ThemesController < ApplicationController
  before_filter :authenticate_user!

  def index

  end

  def new
    @theme = Theme.new
  end

  def create
    @theme = Theme.new(params[:theme])
    @theme.user_id = current_user.id
    phrase_count = params[:theme][:phrases_attributes].count{|key,val| val[:body] != ""}
    p params[:theme][:phrases_attributes]

    if phrase_count >= 16 (Board::WIDTH ** 2) @theme.save
      redirect_to themes_url
    else
      flash.now[:alert] = "Make sure the theme has a name, and at least SIZE^2 phrases"
      render :new
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  # Restrict theme editing to theme owner?
  def update
    @theme = Theme.find(params[:theme][:id])

    #Mark empty fields to delete phrases
    phrase_array = params[:theme][:phrases_attributes]
    phrase_array.each do |index, phrase|
      phrase_array[index][:_destroy] = true if phrase[:body].empty?
    end
    phrase_count = phrase_array.count{|key,val| val[:body] != ""}
    p params[:theme][:phrases_attributes]

    if phrase_count >= 16 && @theme.update_attributes(params[:theme])
      redirect_to themes_url
    else
      flash.now[:alert] = "Make sure the theme has a name, and at least 16 phrases (NYI)"
      render :edit
    end
  end

  def destroy
    @theme = Theme.find(params[:id])
    if @theme.user == current_user
      @theme.destroy
    else
      flash[:alert] = "You are not the author if this theme."
    end
    redirect_to :back
  end


end