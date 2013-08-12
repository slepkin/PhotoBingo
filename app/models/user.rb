class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name

  has_many :themes, inverse_of: :user
  has_many :boards, inverse_of: :user
  has_many :games, through: :boards
  has_many :received_notifications, through: :games, class_name: "Notification",
    source: :notifications
  #NB: This is the notifications you've received in all games, NOT the notifications of which you are the subject
  has_many :visits, inverse_of: :user
  has_many :notifications, foreign_key: :subject_id, inverse_of: :subject
  #NB: These are the notifications ABOUT you
  has_many :votes, inverse_of: :user
  #NB: These are the votes you've made, NOT the votes made on the photos you've posted


  #We'll assume users can't be destroyed.


end
