class Board < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :cells_attributes

  belongs_to :user
  belongs_to :game
  has_many :cells, dependent: :destroy, inverse_of: :board
  has_many :photos, through: :cells
  accepts_nested_attributes_for :cells
  has_many :phrases, through: :cells #needed?

  validates_presence_of :game, :user

  after_create :make_cells
  after_destroy :notify_other_players, :destroy_game_if_empty

  CARDINAL = 4
  WIDTH = 800
  BORDER = 1 #actual border is double this

  def pending_votes(user)
    self.cells.map { |cell| cell.pending_votes(user) }.select{|photo| photo }
  end

  def cell_at(x_coord,y_coord)
    cells.find_by_x_coord_and_y_coord(x_coord, y_coord)
  end

  def win_check
    if wins?
      game.update_attribute(:end, true) #Migrate column
      user.notifications.create(game_id: game.id, quality: "win")
    end
  end

  def wins?
    coords_with_photos = cells.all(
      joins: "INNER JOIN photos ON cells.id = photos.cell_id",
      conditions: "photos.status = 'approved'").
      map{|cell|[cell.x_coord, cell.y_coord]}

    #Check for horizontal or vertical wins
    CARDINAL.times do |i|
      return true if (coords_with_photos.select{|coord| coord[0] == i }.length >= CARDINAL)
      return true if (coords_with_photos.select{|coord| coord[1] == i }.length >= CARDINAL)
    end

    #Check for diagonal win
    return true if (coords_with_photos.select{|coord| coord[0] == coord[1] }.length >= CARDINAL)

    #Check for antidiagonal win
    return true if (coords_with_photos.select{|coord| coord[0] + coord[1] == CARDINAL-1 }.length >= CARDINAL)

    false
  end

  private
  def make_cells
    phrase_ids_to_use = self.game.theme.phrases.pluck(:id).sample(16)
    cells_attributes = []

    CARDINAL.times do |i|
      CARDINAL.times do |j|
        cells_attributes << {
          :phrase_id => phrase_ids_to_use.pop,
          :x_coord => i,
          :y_coord => j
        }
      end
    end

    self.cells.create(cells_attributes)
  end

  def notify_other_players
    game.notifications.create(subject_id: user.id,
      quality: "quit")
  end

  def destroy_game_if_empty
    game.destroy if game.boards.blank?
  end

end