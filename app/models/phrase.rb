class Phrase < ActiveRecord::Base
  attr_accessible :body

  belongs_to :theme

  validates_presence_of :body

  #NB: There is no cells association. Cell -> phrase is one-way
end