class Cell < ActiveRecord::Base
  #This name credited to a Noah Koch!
  attr_accessible :board_id, :phrase_id, :x_coord, :y_coord

  belongs_to :board
  has_one :user, through: :board
  has_one :game, through: :board
  belongs_to :phrase
  has_one :photo, dependent: :destroy, inverse_of: :cell

  validates_presence_of :board, :phrase, :x_coord, :y_coord

  before_destroy :kill_phrase_if_orphan

  #Validate uniqueness of (x_coord, y_coord, board_id)
  #validate x_coord, y_coord in [0...size]

  WIDTH = (Board::WIDTH - 2*Board::BORDER * (Board::CARDINAL-1)).floor / Board::CARDINAL.floor

  def pending_votes(user)
    if photo && photo.pending_votes?(user)
      photo
    else
      nil
    end
  end

  private
  def kill_phrase_if_orphan
    phrase.destroy if (phrase && phrase.theme.nil?)
  end
  #When a theme dies, phrases are not deleted. We want them to be deleted iff they are not attached to any cells or theme

end