module BoardHelper

  def display_at(board, x_coord, y_coord)
    cell = board.cell_at(x_coord,y_coord)
    if cell.photo.nil?
      cell.phrase && cell.phrase.body
    else
      image_tag cell.photo.img.url(:small)
      #Remember to set :small and :big tags, as in AA GitHub
    end
  end

end
