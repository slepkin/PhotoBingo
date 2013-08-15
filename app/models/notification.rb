class Notification < ActiveRecord::Base
  attr_accessible :game_id, :subject_id, :quality, :photo_id

  belongs_to :subject, class_name: "User"
  belongs_to :game
  belongs_to :photo

  validates_presence_of :game, :subject
  validates :quality, :inclusion => {in: ["quit", "new", "accept", "reject", "win"]}


end