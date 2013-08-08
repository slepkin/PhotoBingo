class Phrase < ActiveRecord::Base
  attr_accessible :body

  belongs_to :theme
  has_many :cells

  validates_presence_of :body


end