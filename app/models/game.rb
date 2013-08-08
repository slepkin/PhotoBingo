class Game < ActiveRecord::Base
  attr_accessible :theme_id, :user_ids

  belongs_to :theme
  has_many :boards, dependent: :destroy
  has_many :cells, through: :boards
  has_many :photos, through: :cells
  has_many :users, through: :boards
  has_many :visits, dependent: :destroy
  has_many :notifications, dependent: :destroy

  after_destroy :kill_orphaned_phrases

  #validate >1 user

  def new_notifications?(user)
    last_visit = Visit.find_by_user_id_and_game_id(user.id, self.id)
    last_visit &&
      most_recent_notification &&
      last_visit.updated_at < most_recent_notification.created_at
  end

  def pending_votes(user)
    self.boards.where("user_id <> ?", user.id).map do |board|
      board.pending_votes(user)
    end.inject(:|)
  end

  private
  def most_recent_notification
    self.notifications.order("created_at").last
  end


end