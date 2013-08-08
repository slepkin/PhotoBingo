class Notification < ActiveRecord::Base
  attr_accessible :game_id, :subject_id, :quality, :photo_id
  #body should be a string, in imperative mood

  belongs_to :subject, class_name: "User"
  belongs_to :game
  belongs_to :photo

  # def to_s_with_subject(user)
  #   #Make sure to adjust game/#/show
  #   if user == current_user
  #     body.verb.conjugate(
  #       :aspect => :perfect,
  #       :person => :second,
  #       :subject => "You")
  #   else
  #     body.verb.conjugate( :aspect => :perfect, :subject => user.name)
  # end

end