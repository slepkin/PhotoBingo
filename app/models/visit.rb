class Visit < ActiveRecord::Base
  attr_accessible :user_id, :game_id, :count

  belongs_to :user
  belongs_to :game

  validates_presence_of :user, :game
  validates :count, :numericality => { :greater_than_or_equal_to => 0 }

  after_create :auto_accept_after_a_day

  def auto_accept_after_a_day
    photos = user.boards.find_by_game_id(game_id).photos
    photos.where("photos.created_at < (?)", Time.now - 1.day).update_all(status: "approved")
  end

end