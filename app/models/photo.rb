class Photo < ActiveRecord::Base
  attr_accessible :img, :cell_id, :status
  #status can be "pending", "approved", "rejected"
  #set default to pending in database!!!

  belongs_to :cell
  has_many :votes

  has_attached_file :img, :styles => {
    :big => "600x600",
    :small => "#{Cell::WIDTH}x#{Cell::WIDTH}"
  }

  def pending_votes?(user)
    self.status == "pending" &&
    self.votes.find_by_user_id(user.id).nil? &&
    user.id != cell.board.user.id
  end

  def check_status
    vote_array = self.votes.pluck(:approve)
    number_other_players = (cell.board.game.boards.count - 1).to_f
    #This should run whenever a vote is placed
    if vote_array.count(true) >= (number_other_players / 2).ceil
      self.status = "approved"
      self.save
    elsif vote_array.count(false) >= (number_other_players / 2).floor
      self.status = "rejected"
      self.save
    end
  end

end