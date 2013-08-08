class Theme < ActiveRecord::Base
  attr_accessible :name, :user_id, :phrases_attributes

  belongs_to :user
  has_many :phrases
  accepts_nested_attributes_for :phrases, reject_if: :all_blank, allow_destroy: true
  has_many :games
  # validate at least 16 phrases
  after_destroy :kill_phrases_if_orphan

  validates_presence_of :name, :user_id

  private
  #When a theme dies, phrases are not deleted. We want them to be deleted iff they are not attached to any cells or theme
  def kill_phrases_if_orphan
    phrases.find(:all,
      joins: "LEFT JOIN 'cells' ON phrases.id = cells.phrase_id",
      group: "phrases.id",
      having: "COUNT(cells.id) == 0").
    destroy_all
  end

end