class Visit < ActiveRecord::Base
  attr_accessible :user_id, :game_id, :count

  belongs_to :user
  belongs_to :game

  validates_presence_of :user, :game
  validates :count, :numericality => { :greater_than_or_equal_to => 0 }

end