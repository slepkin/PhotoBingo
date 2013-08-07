class CellsController < ApplicationController
  def show
    @cell = Cell.find(params[:id])
  end
end