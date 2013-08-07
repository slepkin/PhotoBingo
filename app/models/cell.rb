class Cell < ActiveRecord::Base
  #This name credited to a Noah Koch!
  attr_accessible :board_id, :phrase_id, :x_coord, :y_coord

  belongs_to :board
  belongs_to :phrase
  has_one :photo

  #Validate uniqueness of (x_coord, y_coord, board_id)
  #validate x_coord, y_coord in [0...size]

  def pending_votes(user)
    if photo && photo.pending_votes?(user)
      photo
    else
      nil
    end
  end

end