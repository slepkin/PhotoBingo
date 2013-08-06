class Notification < ActiveRecord::Base
  attr_accessible :game_id, :user_id, :html

  belongs_to :subject, class_name: "User"
  belongs_to :game

  #NB: No association inverse of :subject
end