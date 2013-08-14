require_relative '../../lib/exceptions/object_has_errors.rb'

class Theme < ActiveRecord::Base
  attr_accessible :name, :user_id, :phrases_attributes

  belongs_to :user
  has_many :phrases, inverse_of: :theme
  accepts_nested_attributes_for :phrases, reject_if: :all_blank, allow_destroy: true
  has_many :games, inverse_of: :theme
  before_destroy :phrases_unavailable
  before_destroy :exception_if_errors
  after_destroy :destroy_orphan_phrases_else_nullify

  validates_presence_of :name, :user
  validate :phrases_unavailable, on: :update
  validate :sixteen_phrases

  private
  #When a theme dies, phrases are not deleted. We want them to be deleted iff they are not attached to any cells or theme, and otherwise be nullified
  def destroy_orphan_phrases_else_nullify
    phrases_include_cells = phrases.joins("LEFT JOIN 'cells' ON phrases.id = cells.phrase_id").
      group("phrases.id")
    phrases_include_cells.having("COUNT(phrases.id == 0)").destroy_all
    phrases_include_cells.having("COUNT(phrases.id >= 0)").update_all(theme_id: nil)
  end

  def sixteen_phrases
    if phrases.length < 16
      errors.add(:theme, "must have at least 16 phrases.")
    end
  end

  def phrases_unavailable
    if games.present?
      errors.add(:phrases, "can only be edited if no games are using their theme.")
    end
  end

  def exception_if_errors
    if errors.present?
      raise StandardError, errors.full_messages.join("\n")
    end
  end


end

