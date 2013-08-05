class ThemesController < ApplicationController
  before_filter :enforce_login

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
      flash.now[:alert] = "Make sure the theme has a name, and at least 16 phrases (NYI)"
      render :new
    end
  end

  def edit
    @theme = Theme.find(params[:id])
  end

  # Restrict theme editing to theme owner?
  def update
    @theme = Theme.find(params[:theme][:id])
    if @theme.update_attributes(params[:theme])
      redirect_to themes_url
    else
      flash.now[:alert] = "Make sure the theme has a name, and at least 16 phrases (NYI)"
      render :edit
    end
  end

end