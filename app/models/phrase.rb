class Phrase < ActiveRecord::Base
  attr_accessible :body

  belongs_to :theme

  validates_presence_of :body
  #Max body length?
end