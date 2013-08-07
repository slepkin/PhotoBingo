class Visit < ActiveRecord::Base
  attr_accessible :user_id, :game_id, :count

  belongs_to :user
  belongs_to :game

end