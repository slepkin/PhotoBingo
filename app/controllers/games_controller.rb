class GamesController < ApplicationController
  before_filter :authenticate_user!

  def index
    @games = current_user.games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(params[:game])
    if @game.save
      redirect_to game_url(@game)
    else
      flash.now[:alert] = "Could not save boards and cells"
      render :new
    end
  end

  def show

  end
end