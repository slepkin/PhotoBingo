class Game < ActiveRecord::Base
  attr_accessible :theme_id, :user_ids

  belongs_to :theme
  has_many :boards
  has_many :users, through: :boards
  has_many :notifications

end