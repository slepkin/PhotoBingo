class Board < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :cells_attributes

  belongs_to :user
  belongs_to :game
  has_many :cells
  accepts_nested_attributes_for :cells
  has_many :phrases, through: :cells #needed?

  after_create :make_cells

  private
  def make_cells
    phrase_ids_to_use = self.game.theme.phrases.pluck(:id).sample(16)
    cells_attributes = []

    4.times do |i|
      4.times do |j|
        cells_attributes << {
          :phrase_id => phrase_ids_to_use.pop,
          :x_coord => i,
          :y_coord => j
        }
      end
    end

    self.cells.create(cells_attributes)
  end

  def populate(theme)
    p "Starting to populate cells of a board"
    phrase_ids_to_use = theme.phrases.pluck(:id).sample(16)
    self.cells_attributes = []

    4.times do |i|
      4.times do |j|
        print "Adding cell at " +[i,j].to_s
        self.cells.new << {
          :phrase_id => phrase_ids_to_use.pop,
          :x_coord => i,
          :y_coord => j
        }
      end
    end

  end

  def Board.new(options = {})
    board = super(options)
    phrase_ids_to_use = board.theme.phrases.pluck(:id).sample(16)
    board.cells_attributes = []

    4.times do |i|
      4.times do |j|
        print "Adding cell at " +[i,j].to_s
        self.cells_attributes << {
          :phrase_id => phrase_ids_to_use.pop,
          :x_coord => i,
          :y_coord => j
        }
      end
    end
  end

end