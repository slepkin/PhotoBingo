class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name

  has_many :themes
  has_many :boards
  has_many :games, through: :boards
  has_many :visits
  has_many :notifications, through: :games
  #NB: This is the notifications you've received in all games, NOT the notifications of which you are the subject
  has_many :votes
  #NB: These are the votes you've made, NOT the votes made on te photos you've posted


end
