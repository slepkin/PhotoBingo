class Cell < ActiveRecord::Base
  #This name credited to a Noah Koch!
  attr_accessible :board_id, :phrase_id, :x_coord, :y_coord

  belongs_to :board
  belongs_to :phrase
  has_one :photo, dependent: :destroy

  before_destroy :kill_phrase_if_orphan

  #Validate uniqueness of (x_coord, y_coord, board_id)
  #validate x_coord, y_coord in [0...size]

  WIDTH = (800 - 2 * Board::SIZE) / Board::SIZE

  def pending_votes(user)
    if photo && photo.pending_votes?(user)
      photo
    else
      nil
    end
  end

  private
  def kill_phrase_if_orphan
    phrase.destroy if phrase.theme.nil?
  end
  #When a theme dies, phrases are not deleted. We want them to be deleted iff they are not attached to any cells or theme

end