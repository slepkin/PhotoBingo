class BoardsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @board = Board.find(params[:id])
    @game = @board.game
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