class Vote < ActiveRecord::Base
  attr_accessible :user_id, :photo_id, :approve #a boolean

  belongs_to :photo
  belongs_to :user

  after_save :check_status_of_photo

  private
  def check_status_of_photo
    self.photo.check_status
  end

end