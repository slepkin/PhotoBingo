module BoardHelper

  def display_at(board, x_coord, y_coord)
    cell = board.cell_at(x_coord,y_coord)
    if cell.photo.nil?
      cell.phrase && cell.phrase.body
    else
      photo = cell.photo
      (image_tag photo.img.url(:small)) + marker_for(photo).html_safe
    end
  end

  def marker_for(photo)
    case photo.status
    when "approved"
      "<status-marker class='green'></status-marker>"
    when "rejected"
      "<status-marker class='red'></status-marker>"
    when "pending"
      "<status-marker class='yellow'></status-marker>"
    end
  end

end
