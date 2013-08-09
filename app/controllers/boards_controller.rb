class BoardsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @board = Board.find(params[:id])
    @game = @board.game
    unless (@board.user == current_user) || @game.end
      flash[:notice] = "You may not view this board until the game is over."
      redirect_to :back
    end
  end

  def destroy
    @board = Board.find(params[:id])
    if current_user == @board.user
      @board.destroy
      redirect_to games_url
    else
      flash[:alert] = "That's not your board."
      redirect_to :back
    end
  end
end