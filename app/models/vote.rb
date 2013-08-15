class Vote < ActiveRecord::Base
  attr_accessible :user_id, :photo_id, :approve #a boolean

  belongs_to :photo
  belongs_to :user

  validates_presence_of :user, :photo
  validates :approve, :inclusion => {:in => [true, false]}
  validates_uniqueness_of :user_id, :scope => [:photo_id]

  after_save :check_status_of_photo

  private
  def check_status_of_photo
    photo.check_status if (photo && photo.status == "pending")
  end

end