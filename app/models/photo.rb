class Photo < ActiveRecord::Base
  attr_accessible :src, :cell_id

  belongs_to :cell

end