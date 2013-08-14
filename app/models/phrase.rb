class Phrase < ActiveRecord::Base
  attr_accessible :body

  belongs_to :theme
  has_many :cells, inverse_of: :phrase

  validates_presence_of :body


end