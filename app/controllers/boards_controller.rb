class BoardsController < ApplicationController
  before_filter :authenticate_user!
  def show
    @board = Board.find(params[:id])
    @game = @board.game
  end
end