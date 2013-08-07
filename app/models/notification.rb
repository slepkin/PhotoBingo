class Notification < ActiveRecord::Base
  attr_accessible :game_id, :subject_id, :body, :strong

  belongs_to :subject, class_name: "User"
  belongs_to :game

  #NB: No association inverse of :subject

  def display_for(user)
    "Remember to write the display_for method, for notifications"
  end
end