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

    if phrase_count >= (Board::CARDINAL ** 2) && @theme.save
      redirect_to themes_url
    else
      flash.now[:alert] = "Make sure the theme has a name, and at least 16 phrases"
      render :new
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  # Restrict theme editing to theme owner?

  def update
    @theme = Theme.find(params[:theme][:id])

    #Mark empty fields to destroy orphan phrases, or nullify those with a cell still attached
    phrase_array = params[:theme][:phrases_attributes]
    phrase_array.each do |index, phrase|
      phrase_array[index][:_destroy] = true if (phrase[:body]=="" && phrase[:id].present?)
    end

    phrase_count = phrase_array.count{|key,val| val[:body] != ""}

    if !@theme.phrases.joins(:cells).blank?
      flash[:alert] = "A theme can only be edited if not in use in a game."
      redirect_to themes_url
    elsif phrase_count >= (Board::CARDINAL ** 2) && @theme.update_attributes(params[:theme])
      p @theme.errors
      redirect_to themes_url
    else
      flash.now[:alert] = "Make sure the theme has a name, and at least 16 phrases"
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