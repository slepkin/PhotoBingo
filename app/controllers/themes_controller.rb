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

    if @theme.save
      redirect_to themes_url
    else
      flash.now[:alert] = @theme.errors.full_messages.join("\n")
      render :new
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  def update
    @theme = Theme.find(params[:theme][:id])

    #Mark empty fields to destroy orphan phrases, or nullify those with a cell still attached
    phrase_array = params[:theme][:phrases_attributes]
    phrase_array.each do |index, phrase|
      phrase_array[index][:_destroy] = true if (phrase[:body]=="" && phrase[:id].present?)
    end
    debugger
    if current_user != @theme.user
      flash[:alert] = "That's not your theme."
      redirect_to themes_url
    elsif phrase_array.values.count { |phrase| phrase[:body] != "" } < 16
      flash.now[:alert] = "Theme must have at least 16 phrases."
      render :edit
    elsif @theme.update_attributes(params[:theme])
      redirect_to themes_url
    else
      flash.now[:alert] = @theme.errors.full_messages.join("\n")
      render :edit
    end
  end

  def destroy
    @theme = Theme.find(params[:id])

    if current_user == @theme.user
      begin
        @theme.destroy
      rescue StandardError => e
        flash[:alert] = e.message
      ensure
        redirect_to :back
      end
    else
      flash[:alert] = "That's not your theme."
      redirect_to themes_url
    end
  end


end
