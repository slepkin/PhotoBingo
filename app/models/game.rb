class Game < ActiveRecord::Base
  attr_accessible :theme_id, :user_ids, :end

  belongs_to :theme
  has_many :boards, dependent: :destroy, inverse_of: :game
  has_many :cells, through: :boards
  has_many :photos, through: :cells
  has_many :users, through: :boards
  has_many :visits, dependent: :destroy, inverse_of: :game
  has_many :notifications, dependent: :destroy, inverse_of: :game

  validates_presence_of :theme
  validates :end, :inclusion => {:in => [true, false]}
  validate :two_players

  def new_notifications?(user)
    last_visit = Visit.find_by_user_id_and_game_id(user.id, id)
    most_recent_notification &&
      (!last_visit || last_visit.updated_at < most_recent_notification.created_at)
  end

  def pending_votes(voting_user)
    boards.where("user_id <> ?", voting_user.id).map do |board|
      board.pending_votes(voting_user)
    end.inject(:|)
  end

  private
  def most_recent_notification
    self.notifications.order("created_at").last
  end

  def two_players
    errors.add(:game, "must have multiple players.") if users.length < 2
  end


end