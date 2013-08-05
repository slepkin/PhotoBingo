class User < ActiveRecord::Base
  has_secure_password
  attr_accessible :name, :password, :password_confirmation, :password_digest

  has_many :themes
  # has_many :boards
  # has_many :games, through: :boards
  # has_many :votes

  validates_presence_of :name, uniqueness: true

end