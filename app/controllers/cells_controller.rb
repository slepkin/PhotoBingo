class CellsController < ApplicationController
  def show
    @cell = Cell.find(params[:id])
    @photo = @cell.photo
  end
end