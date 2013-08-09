class Photo < ActiveRecord::Base
  attr_accessible :img, :cell_id, :status
  #status can be "pending", "approved", "rejected"
  #set default to pending in database!!!

  belongs_to :cell
  has_many :notifications, dependent: :destroy
  has_many :votes, dependent: :destroy

  has_attached_file :img, :styles => {
    :big => "600x600",
    :small => "#{Cell::WIDTH}x#{Cell::WIDTH}"
  }

  after_create :notify_players

  def pending_votes?(user)
    !cell.board.game.end &&
    status == "pending" &&
    votes.find_by_user_id(user.id).nil? &&
    user.id != cell.board.user.id
  end

  def check_status
    #This should run whenever a vote is placed
    game = cell.board.game
    vote_array = self.votes.pluck(:approve)
    number_other_players = (game.boards.count - 1).to_f
    if vote_array.count(true) >= (number_other_players / 2).ceil
      update_attribute(:status, "approved")
      notifications.create(subject_id: cell.board.user.id,
        game_id: game.id,
        quality: "accept")
        cell.board.win_check
    elsif vote_array.count(false) >= (number_other_players / 2).floor
      update_attribute(:status, "rejected")
      notifications.create(subject_id: cell.board.user.id,
        game_id: game.id,
        quality: "reject")
    end
  end

  private
  def notify_players
    board = cell.board
    board.game.notifications.create(subject_id: board.user.id,
      quality: "new", photo_id: id)
      #I'm worried that the photo doesn't know its primary key yet
  end

end