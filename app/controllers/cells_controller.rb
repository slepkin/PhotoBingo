class CellsController < ApplicationController
  def show
    @cell = Cell.find(params[:id])
    @photo = @cell.photo
    @game = @cell.game
    @game_ended = @cell.game.end
    @is_owner = (current_user == @cell.user)
    @photo_exists = !!@photo
  end
end