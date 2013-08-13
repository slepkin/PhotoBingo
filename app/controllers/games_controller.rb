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
      flash.now[:alert] = "Could not save game"
      render :new
    end
  end

  def show
    @game = Game.find(params[:id])
    visit = @game.visits.find_or_initialize_by_user_id(current_user.id)
    visit.count += 1
    visit.save
  end
end